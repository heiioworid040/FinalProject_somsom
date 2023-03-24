package com.project.controller;

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
			
//			int count=orderService.getOrderCount();
//			int pageBlock=10;
//			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//			int endPage=startPage+pageBlock-1;
//			int pageCount=count/pageSize+(count%pageSize==0?0:1);
//			if(endPage>pageCount) {
//				endPage=pageCount;
//			}
			
			String btn_can=(String)request.getParameter("btn_can");
			String click_cli=(String)request.getParameter("cliPop");
			String click_emp=(String)request.getParameter("empPop");
			System.out.println(btn_can);
//			String result=btn_can;
//			String click_prod=(String)request.getParameter("btn_can");
//			System.out.println(click_cli);
//			System.out.println(click_emp);
//			System.out.println(click_prod);
			
			model.addAttribute("btn_can",btn_can);
//			model.addAttribute("Pop", result);
			model.addAttribute("orderInsertList", orderInsertList);
			return "/order/orderInsert";
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
			return "/order/orderInfo";
		}
		
		@RequestMapping(value = "/order/orderPop", method = RequestMethod.GET)
		public String pop(HttpServletRequest request, Model model) {
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
			
//			String click_cli=(String)request.getParameter("cli_Pop");
//			String click_emp=(String)request.getParameter("emp_Pop");
			List<ProductDTO> orderPop=productService.getProductList(pageDTO);
			
//			System.out.println(click_cli);
//			System.out.println(click_emp);
//			System.out.println(click_prod);
			
			int count=productService.getProductCount();
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage>pageCount) {
				endPage=pageCount;
			}
			
			model.addAttribute("orderPop", orderPop);
//			model.addAttribute("Pop", result);
			return "order/orderPop";
		}
		
}