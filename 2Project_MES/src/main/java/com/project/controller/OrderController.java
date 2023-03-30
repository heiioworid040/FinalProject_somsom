package com.project.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.OrderDTO;
import com.project.domain.PageDTO;
import com.project.service.OrderService;

@Controller
public class OrderController {
	
		@Inject
		private OrderService orderService;
		
		@RequestMapping(value = "/order/searchPop", method = RequestMethod.GET)
		public String searchPop(HttpServletRequest request, Model model) {
			String pop=(String)request.getParameter("pop");
			String cd=(String)request.getParameter("cd");
			String nm=(String)request.getParameter("nm");
			String info=(String)request.getParameter("info");
			
			int pageSize=10;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) pageNum="1";
			int currentPage=Integer.valueOf(pageNum);
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			pageDTO.setSearch(cd);
			pageDTO.setSearch2(nm);
			pageDTO.setSearch3(info);
			
			int count=0;
			List<OrderDTO> popList;
			if(pop.equals("cliS")||pop.equals("cli")) {
				popList=orderService.getSearchCli(pageDTO);
				count=orderService.getSearchCliCount(pageDTO);
			}else if(pop.equals("empS")||pop.equals("emp")) {
				popList=orderService.getSearchEmp(pageDTO);
				count=orderService.getSearchEmpCount(pageDTO);
			}else {
				popList=orderService.getSearchProd(pageDTO);
				count=orderService.getSearchProdCount(pageDTO);
			}
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage>pageCount) endPage=pageCount;
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			model.addAttribute("pop", pop);
			model.addAttribute("popList", popList);
			model.addAttribute("pageDTO", pageDTO);
			return "order/searchPop";
		}
		
		@RequestMapping(value = "/order/orderInsert", method = RequestMethod.GET)
		public String insert(HttpServletRequest request, Model model) {
			PageDTO pageDTO=new PageDTO();
			pageDTO.setSearch(request.getParameter("cli"));
			pageDTO.setSearch2(request.getParameter("emp"));
			pageDTO.setSearch3(request.getParameter("ord_date"));
			pageDTO.setSearch4(request.getParameter("ord_date_end"));
			pageDTO.setSearch5(request.getParameter("ord_d_date"));
			pageDTO.setSearch6(request.getParameter("ord_d_date_end"));
			
			List<OrderDTO> orderInsertList=orderService.getOrderInsertList(pageDTO);
			
			int count=orderService.getOrderCount();
			pageDTO.setCount(count);
			
			SimpleDateFormat dfm=new SimpleDateFormat("yyyy-MM-dd");
			
			String ord_cd=(String)request.getParameter("ord_cd");
			if(ord_cd!=null) {
				OrderDTO orderDTO=orderService.getOrderInsert(ord_cd);
				String ord_dateD=dfm.format(orderDTO.getOrd_date());
				String ord_d_dateD=dfm.format(orderDTO.getOrd_d_date());
				model.addAttribute("ord_date", ord_dateD);
				model.addAttribute("ord_d_date", ord_d_dateD);
				model.addAttribute("orderDTO", orderDTO);
			}

			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("orderInsertList", orderInsertList);
			return "order/orderInsert";
		}
		
		@RequestMapping(value = "/order/orderInsertPro", method = RequestMethod.POST)
		public String insertPro(HttpServletRequest request, Model model) {
			OrderDTO orderDTO=new OrderDTO();
			orderDTO.setOrd_cd(request.getParameter("ord_cd"));
			orderDTO.setCli_cd(request.getParameter("cli_cd"));
			orderDTO.setEmp_cd(request.getParameter("emp_cd"));
			orderDTO.setProd_cd(request.getParameter("prod_cd"));
			orderDTO.setOrd_count(Integer.parseInt(request.getParameter("ord_count")));
			orderDTO.setOrd_date(Timestamp.valueOf(request.getParameter("ord_date")+" 23:59:59"));
			orderDTO.setOrd_d_date(Timestamp.valueOf(request.getParameter("ord_d_date")+" 23:59:59"));
			
			String btn_add=(String)request.getParameter("btn_add");
			String btn_edit=(String)request.getParameter("btn_edit");
			String btn_del=(String)request.getParameter("btn_del");
			
			if(btn_add!=null) {
				orderService.orderAdd(orderDTO);
			}else if(btn_edit!=null) {
				orderService.orderEdit(orderDTO);
			}else if(btn_del!=null){
				orderService.orderDel(orderDTO);
			}
			
			return "redirect:/order/orderInsert";
		}
		
		@RequestMapping(value = "/order/orderInfo", method = RequestMethod.GET)
		public String info(HttpServletRequest request, Model model) {
			PageDTO pageDTO=new PageDTO();
			pageDTO.setSearch(request.getParameter("cli"));
			pageDTO.setSearch2(request.getParameter("emp"));
			pageDTO.setSearch3(request.getParameter("ord_date"));
			pageDTO.setSearch4(request.getParameter("ord_date_end"));
			pageDTO.setSearch5(request.getParameter("ord_d_date"));
			pageDTO.setSearch6(request.getParameter("ord_d_date_end"));
			pageDTO.setSearch7(request.getParameter("prod"));
			
			List<OrderDTO> orderList=orderService.getOrderList(pageDTO);
			
			int count=orderService.getOrderCount();
			pageDTO.setCount(count);
			
			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("orderList", orderList);
			return "order/orderInfo";
		}

}