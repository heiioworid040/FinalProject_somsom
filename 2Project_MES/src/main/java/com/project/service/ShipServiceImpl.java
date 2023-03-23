package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.ShipDAO;
import com.project.domain.PageDTO;
import com.project.domain.ShipDTO;

@Service
public class ShipServiceImpl implements ShipService{
	
	@Inject
	private ShipDAO shipDAO;

	@Override
	public List<ShipDTO> shipCurrentInfo(PageDTO pageDTO) {
		System.out.println("ShipServiceImpl shipCurrentInfo()");
		// 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;

		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);

		return shipDAO.shipCurrentInfo(pageDTO);
	}

	@Override
	public int shipCurrentCount() {
		System.out.println("ShipServiceImpl shipCurrentCount()");

		return shipDAO.shipCurrentCount();
	}

}
