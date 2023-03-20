package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.WiDAO;
import com.project.domain.PageDTO;
import com.project.domain.WiDTO;

@Service
public class WiServiceImpl implements WiService{
	
	@Inject
	private WiDAO wiDAO; 

	@Override
	public List<WiDTO> getWiList(PageDTO pageDTO) {
		System.out.println("WiserviceImpl getWiList()");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		return wiDAO.getWiList(pageDTO);
	}

	@Override
	public int getWiCount() {
		System.out.println("WiserviceImpl getWiCount()");
		
		return wiDAO.getWiCount();
	}

}
