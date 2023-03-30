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
	
	//수주관리(수주품목)
	public List<OrderDTO> getOrderInsertList(PageDTO pageDTO) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;

		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);

		return orderDAO.getOrderInsertList(pageDTO);
	}

	//수주관리(수주상세)
	public OrderDTO getOrderInsert(String ord_cd) {
		return orderDAO.getOrderInsert(ord_cd);
	}
	
	//수주 추가
	public void orderAdd(OrderDTO orderDTO) {
		String num;
		System.out.println(orderDAO.getOrdNum());
//		orderDAO.getOrdNum() 50행 num 앞에 붙이기
		if(orderDAO.getMaxNum(orderDTO)==null) {
			num="001";
		}else {
			if((orderDAO.getMaxNum(orderDTO))<9) {
				num="00"+(orderDAO.getMaxNum(orderDTO)+1);
			}else if((orderDAO.getMaxNum(orderDTO))<99) {
				num="0"+(orderDAO.getMaxNum(orderDTO)+1);
			}else {
				num=""+(orderDAO.getMaxNum(orderDTO)+1);
			}
		}
		orderDTO.setOrd_cd(orderDAO.getOrdNum()+num+(String.valueOf(orderDTO.getOrd_date()).substring(0,10)).replace("-", ""));
		
		orderDAO.orderAdd(orderDTO);
	}
	
	//수주 수정
	public void orderEdit(OrderDTO orderDTO) {
		orderDAO.orderEdit(orderDTO);
	}
	
	//수주 삭제
	public void orderDel(OrderDTO orderDTO) {
		orderDAO.orderDel(orderDTO);
	}
	
	//수주현황
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
	
	//팝업
	public List<OrderDTO> getSearchCli(PageDTO pageDTO) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return orderDAO.getSearchCli(pageDTO);
	}
	
	public int getSearchCliCount(PageDTO pageDTO) {
		return orderDAO.getSearchCliCount(pageDTO);
	}

	public List<OrderDTO> getSearchEmp(PageDTO pageDTO) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return orderDAO.getSearchEmp(pageDTO);
	}
	
	public int getSearchEmpCount(PageDTO pageDTO) {
		return orderDAO.getSearchEmpCount(pageDTO);
	}

	public List<OrderDTO> getSearchProd(PageDTO pageDTO) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return orderDAO.getSearchProd(pageDTO);
	}
	
	public int getSearchProdCount(PageDTO pageDTO) {
		return orderDAO.getSearchProdCount(pageDTO);
	}
}