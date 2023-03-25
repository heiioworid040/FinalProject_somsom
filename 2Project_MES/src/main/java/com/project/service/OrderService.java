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
	public void insertPro(OrderDTO orderDTO) {
		String num;
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
		orderDTO.setOrd_cd((String.valueOf(orderDTO.getOrd_date()).substring(0,10)).replace("-", "")+num);
		
		orderDAO.insertPro(orderDTO);
	}
	
	//수주현황
	public List<OrderDTO> getOrderList(PageDTO pageDTO) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;

		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);

		return orderDAO.getOrderList(pageDTO);
	}
	
	//수주현황 검색 (수정 중)
	public List<OrderDTO> getOrderList(PageDTO pageDTO, String cli_cd) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;

		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);

		return orderDAO.getOrderList(pageDTO, cli_cd);
	}
	
	public int getOrderCount() {
		return orderDAO.getOrderCount();
	}
	
	//팝업
	public List<OrderDTO> getOrderPop(PageDTO pageDTO) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;

		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);

		return orderDAO.getOrderPop(pageDTO);
	}

}