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

import com.project.domain.ClientDTO;
import com.project.domain.EmployeeDTO;
import com.project.domain.OrderDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;
import com.project.service.ClientService;
import com.project.service.EmployeeService;
import com.project.service.OrderService;
import com.project.service.ProductService;

@Controller
public class OrderController {
	
		@Inject
		private OrderService orderService;
		
		@Inject
		private EmployeeService employeeService;

		@Inject
		private ClientService clientService;

		@Inject
		private ProductService productService;
		
		@RequestMapping(value = "/order/searchPop", method = RequestMethod.GET)
		public String searchpop(HttpServletRequest request, Model model) {
			int pageSize=10;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) {
				pageNum="1";
			}
			int currentPage=Integer.valueOf(pageNum);
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			String pop=(String)request.getParameter("pop");

			int count=0;
			System.out.println(pop);
			if(pop.equals("cli")) {
				List<ClientDTO> searchPop=clientService.getClientInfo(pageDTO);
				model.addAttribute("searchPop", searchPop);
				count=clientService.getClientCount();
			}else if(pop.equals("emp")) {
				List<EmployeeDTO> searchPop=employeeService.getEmployeeList(pageDTO);
				model.addAttribute("searchPop", searchPop);
				count=employeeService.getEmployeeCount();
			}else {
				List<ProductDTO> searchPop=productService.getProductList(pageDTO);
				model.addAttribute("searchPop", searchPop);
				count=productService.getProductCount(pageDTO);
			}
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage>pageCount) {
				endPage=pageCount;
			}
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			model.addAttribute("pop", pop);
			model.addAttribute("pageDTO", pageDTO);
			return "order/searchPop";
		}
		
		@RequestMapping(value = "/order/orderInsert", method = RequestMethod.GET)
		public String insert(HttpServletRequest request, Model model) {
			int pageSize=10;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) {
				pageNum="1";
			}
			int currentPage=Integer.valueOf(pageNum);
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			List<OrderDTO> orderInsertList=orderService.getOrderInsertList(pageDTO);
			
			int count=orderService.getOrderCount();
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage>pageCount) {
				endPage=pageCount;
			}
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			SimpleDateFormat dfm=new SimpleDateFormat("yyyy-MM-dd");
			
			String ord_cd=(String)request.getParameter("ord_cd");
			if(ord_cd!=null) {
				OrderDTO orderDTO=orderService.getOrderInsert(ord_cd);
				String ord_date=dfm.format(orderDTO.getOrd_date());
				String ord_d_date=dfm.format(orderDTO.getOrd_d_date());
//				String ord_date=String.valueOf(orderDTO.getOrd_date()).substring(0,10);
//				String ord_d_date=String.valueOf(orderDTO.getOrd_d_date()).substring(0,10);
				model.addAttribute("ord_date", ord_date);
				model.addAttribute("ord_d_date", ord_d_date);
				model.addAttribute("orderDTO", orderDTO);
			}
			
//			String btn_can=(String)request.getParameter("btn_can");
//			String click_cli=(String)request.getParameter("cliPop");
//			String click_emp=(String)request.getParameter("empPop");
//			System.out.println(btn_can);
//			String result=btn_can;
//			String click_prod=(String)request.getParameter("btn_can");
//			System.out.println(click_cli);
//			System.out.println(click_emp);
//			System.out.println(click_prod);
			
//			model.addAttribute("btn_can",btn_can);
//			model.addAttribute("Pop", result);
			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("orderInsertList", orderInsertList);
			return "order/orderInsert";
		}
		
		@RequestMapping(value = "/order/orderInsertPro", method = RequestMethod.POST)
		public String insertPro(HttpServletRequest request, Model model) {
			String ord_cd=(String)request.getParameter("ord_cd");
			String cli_cd=(String)request.getParameter("cli_cd");
			String emp_cd=(String)request.getParameter("emp_cd");
			String prod_cd=(String)request.getParameter("prod_cd");
			int ord_count=Integer.parseInt(request.getParameter("ord_count"));
			Timestamp ord_date=Timestamp.valueOf((String)request.getParameter("ord_date")+" 23:59:59");
			Timestamp ord_d_date=Timestamp.valueOf((String)request.getParameter("ord_d_date")+" 23:59:59");

			OrderDTO orderDTO=new OrderDTO();
			orderDTO.setOrd_cd(ord_cd);
			orderDTO.setCli_cd(cli_cd);
			orderDTO.setEmp_cd(emp_cd);
			orderDTO.setProd_cd(prod_cd);
			orderDTO.setOrd_count(ord_count);
			orderDTO.setOrd_date(ord_date);
			orderDTO.setOrd_d_date(ord_d_date);
			
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
			
//			model.addAttribute("orderDTO", orderDTO);
			return "redirect:/order/orderInsert";
		}
		
		@RequestMapping(value = "/order/orderInfo", method = RequestMethod.GET)
		public String info(HttpServletRequest request, Model model) {
			int pageSize=10;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) {
				pageNum="1";
			}
			int currentPage=Integer.valueOf(pageNum);
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			String cli_cd=request.getParameter("cli_cd");
			List<OrderDTO> orderList=null;
			
			//cli_cd=&emp_cd=&ord_date=&ord_date_end=&ord_d_date=&ord_d_date_end=&prod_cd=
			if(cli_cd!=null) {
				orderList=orderService.getOrderList(pageDTO, cli_cd);
			}
			else {
				orderList=orderService.getOrderList(pageDTO);
			}
			
//			int count=orderService.getOrderCount();
//			int pageBlock=10;
//			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//			int endPage=startPage+pageBlock-1;
//			int pageCount=count/pageSize+(count%pageSize==0?0:1);
//			if(endPage>pageCount) {
//				endPage=pageCount;
//			}
			
			model.addAttribute("orderList", orderList);
			return "order/orderInfo";
		}
		
		@RequestMapping(value = "/order/prodPop", method = RequestMethod.GET)
		public String Prodpop(HttpServletRequest request, Model model) {
			int pageSize=10;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) {
				pageNum="1";
			}
			int currentPage=Integer.valueOf(pageNum);
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			List<ProductDTO> prodPop=productService.getProductList(pageDTO);
			
			int count=productService.getProductCount(pageDTO);
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage>pageCount) {
				endPage=pageCount;
			}
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			model.addAttribute("prodPop", prodPop);
			model.addAttribute("pageDTO", pageDTO);
			return "order/prodPop";
		}
		
		@RequestMapping(value = "/order/cliPop", method = RequestMethod.GET)
		public String clipop(HttpServletRequest request, Model model) {
			int pageSize=10;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) {
				pageNum="1";
			}
			int currentPage=Integer.valueOf(pageNum);
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			List<ClientDTO> cliPop=clientService.getClientInfo(pageDTO);
			
			int count=clientService.getClientCount();
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage>pageCount) {
				endPage=pageCount;
			}
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			model.addAttribute("cliPop", cliPop);
			model.addAttribute("pageDTO", pageDTO);
			return "order/cliPop";
		}
		
		@RequestMapping(value = "/order/empPop", method = RequestMethod.GET)
		public String emppop(HttpServletRequest request, Model model) {
			int pageSize=10;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) {
				pageNum="1";
			}
			int currentPage=Integer.valueOf(pageNum);
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			List<EmployeeDTO> empPop=employeeService.getEmployeeList(pageDTO);
			
			int count=employeeService.getEmployeeCount();
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage>pageCount) {
				endPage=pageCount;
			}
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			model.addAttribute("empPop", empPop);
			model.addAttribute("pageDTO", pageDTO);
			return "order/empPop";
		}
}