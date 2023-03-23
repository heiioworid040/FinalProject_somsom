package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.project.dao.OrderDAO;
import com.project.domain.OrderDTO;
import com.project.domain.PageDTO;

@Repository
public class OrderService {

	@Inject
	private OrderDAO orderDAO;

	public List<OrderDTO> getOrderList(PageDTO pageDTO) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;

		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);

		return orderDAO.getOrderList(pageDTO);
	}

	public int getOrderCount() {
		return orderDAO.getOrderCount();
	}

}