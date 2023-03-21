package com.project.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.OrderDTO;
import com.project.service.OrderService;

@Controller
public class OrderController {
	
		@Inject
		private OrderService orderService;
	
		@RequestMapping(value = "/order/orderInfo", method = RequestMethod.GET)
		public String info(OrderDTO orderDTO) {
			orderService.getOrder(orderDTO);
			return "/order/orderInfo";
		}
		
//		@RequestMapping(value = "/orders/ordersInsert", method = RequestMethod.GET)
//		public String insert(Orders orders) {
		
//			return "/orders/ordersInsert";
//		}

}
