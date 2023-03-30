package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.ShipDAO;
import com.project.domain.PageDTO;
import com.project.domain.ShipDTO;

@Service
public class ShipServiceImpl implements ShipService {

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

	// 검색어
	@Override
	public int shipCurrentCount(PageDTO pageDTO) {
		System.out.println("ShipServiceImpl shipCurrentCount()");

		return shipDAO.shipCurrentCount(pageDTO);
	}

	@Override
	public void currDelete(String ship_cd) {
		System.out.println("BoardServiceImpl currDelete()");

		shipDAO.currDelete(ship_cd);

	}

	@Override
	public List<ShipDTO> shipInfo(PageDTO pageDTO) {
		return shipDAO.shipInfo(pageDTO);
	}

	@Override
	public void shipInfoPro(ShipDTO shipDTO) {
		String num;
		if(shipDAO.getMaxNum(shipDTO)==null) {
			num="001";
		}else {
			if((shipDAO.getMaxNum(shipDTO))<9) {
				num="00"+(shipDAO.getMaxNum(shipDTO)+1);
			}else if(shipDAO.getMaxNum(shipDTO)<99) {
				num="0"+(shipDAO.getMaxNum(shipDTO)+1);
			}else {
				num=""+(shipDAO.getMaxNum(shipDTO)+1);
			}
		}
		shipDTO.setShip_cd(shipDAO.getShipNum()+num+(String.valueOf(shipDTO.getShip_date()).substring(0,10)).replace("-", ""));
		
		shipDAO.shipInfoPro(shipDTO);
	}
}
