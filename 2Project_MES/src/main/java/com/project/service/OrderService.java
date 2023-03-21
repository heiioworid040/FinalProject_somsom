package com.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.project.dao.OrderDAO;
import com.project.domain.OrderDTO;

@Repository
public class OrderService {
	
	@Inject
	private OrderDAO orderDAO;
	
	public void getOrder(OrderDTO orderDTO) {
		orderDAO.getOrder(orderDTO);
	}
}
