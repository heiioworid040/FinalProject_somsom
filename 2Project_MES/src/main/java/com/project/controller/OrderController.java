package com.project.controller;

import java.sql.Timestamp;
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
			String id=(String)request.getParameter("id");
			
			int pageSize=7;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) { pageNum="1"; }
			int currentPage=Integer.parseInt(pageNum);
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			pageDTO.setSearch(cd);
			pageDTO.setSearch2(nm);
			pageDTO.setSearch3(info);
			
			int count=0;
			List<OrderDTO> popList;
			if(pop.equals("cliS")||pop.equals("cli")||pop.equals("cliO")) {
				popList=orderService.getSearchCli(pageDTO);
				count=orderService.getSearchCliCount(pageDTO);
			}else if(pop.equals("empS")||pop.equals("emp")||pop.equals("empO")) {
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
			if(endPage>pageCount) { endPage=pageCount; }

			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			if(pop.equals("cliO")||pop.equals("empO")||pop.equals("prodO")) {
				model.addAttribute("id", id);
			}
			
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

			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("orderInsertList", orderInsertList);
			return "order/orderInsert";
		}
		
		@RequestMapping(value = "/order/orderInsertPro", method = RequestMethod.POST)
		public String insertPro(HttpServletRequest request, Model model) {
			String ord_cd=request.getParameter("ord_cd");
			
			OrderDTO orderDTO=new OrderDTO();
			orderDTO.setOrd_cd(ord_cd);
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
				orderService.orderDel(ord_cd);
			}
			return "redirect:/order/orderInsert";
		}
		
		@RequestMapping(value = "/order/orderInfo", method = RequestMethod.GET)
		public String info(HttpServletRequest request, Model model) {
			PageDTO pageDTO=new PageDTO();
			pageDTO.setSearch(request.getParameter("cli"));
			pageDTO.setSearch2(request.getParameter("emp"));
			pageDTO.setSearch3(request.getParameter("ord"));
			pageDTO.setSearch4(request.getParameter("ord_end"));
			pageDTO.setSearch5(request.getParameter("ord_d"));
			pageDTO.setSearch6(request.getParameter("ord_d_end"));
			pageDTO.setSearch7(request.getParameter("prod"));
			
			List<OrderDTO> orderList=orderService.getOrderList(pageDTO);
			
			int count=orderService.getOrderCount();
			pageDTO.setCount(count);
			
			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("orderList", orderList);
			return "order/orderInfo";
		}
		
		@RequestMapping(value = "/order/orderInfoPro", method = RequestMethod.POST)
		public String infoPro(HttpServletRequest request, Model model) {
			String ord_cd[]=request.getParameterValues("ord_cd");

			String ck[]=request.getParameterValues("ck");
			String btn=(String)request.getParameter("btn");
		
			if(btn.equals("del")) {
					for(int i=0;i<ck.length;i++) {
						String[] str = ck[i].split(",");
						orderService.orderDel(str[1]);
					}
			}else if(btn.equals("edit")) {
					for(int i=0;i<ck.length;i++) {
						if(ck[i]!="") {
							String[] str = ck[i].split(",");
				
							OrderDTO orderDTO=new OrderDTO();
							orderDTO.setOrd_cd(str[1]);
							orderDTO.setCli_cd(orderService.orderCli(request.getParameter("cli_nm"+str[0])));
							orderDTO.setEmp_cd(orderService.orderEmp(request.getParameter("emp_nm"+str[0])));
							orderDTO.setProd_cd(request.getParameter("prod_cd"+str[0]));
							orderDTO.setOrd_count(Integer.parseInt(request.getParameter("ord_count"+str[0])));
							orderDTO.setOrd_date(Timestamp.valueOf(request.getParameter("ord_date"+str[0])+" 23:59:59"));
							orderDTO.setOrd_d_date(Timestamp.valueOf(request.getParameter("ord_d_date"+str[0])+" 23:59:59"));
							orderService.orderEdit(orderDTO);
						}
					}
			}else {
					for(int i=0;i<ord_cd.length;i++) {
						String cli_nm[]=request.getParameterValues("cli_nm");
						String emp_nm[]=request.getParameterValues("emp_nm");
						String prod_cd[]=request.getParameterValues("prod_cd");
						String ord_count[]=request.getParameterValues("ord_count");
						String ord_date[]=request.getParameterValues("ord_date");
						String ord_d_date[]=request.getParameterValues("ord_d_date");
						
						if(ord_cd[i]==""&&(cli_nm[i]!=""||emp_nm[i]!=""||prod_cd[i]!=""||ord_count[i]!=""||ord_date[i]!=""||ord_d_date[i]!="")) {
							String cli_cd=orderService.orderCli(cli_nm[i]);
							String emp_cd=orderService.orderEmp(emp_nm[i]);
				
							OrderDTO orderDTO=new OrderDTO();
							orderDTO.setCli_cd(cli_cd);
							orderDTO.setEmp_cd(emp_cd);
							orderDTO.setProd_cd(prod_cd[i]);
							orderDTO.setOrd_count(Integer.parseInt(ord_count[i]));
							orderDTO.setOrd_date(Timestamp.valueOf(ord_date[i]+" 23:59:59"));
							orderDTO.setOrd_d_date(Timestamp.valueOf(ord_d_date[i]+" 23:59:59"));
							orderService.orderAdd(orderDTO);
						}
					}
			}
			return "redirect:/order/orderInfo";
		}
}