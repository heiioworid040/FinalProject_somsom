package com.project.controller;

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
			List<OrderDTO> orderList=orderService.getOrderList(pageDTO);
			
			int count=orderService.getOrderCount();
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage>pageCount) {
				endPage=pageCount;
			}
			
			model.addAttribute("orderList", orderList);
			return "/order/orderInfo";
		}
		
//		@RequestMapping(value = "/orders/ordersInsert", method = RequestMethod.GET)
//		public String insert(Orders orders) {
		
//			return "/orders/ordersInsert";
//		}

}
