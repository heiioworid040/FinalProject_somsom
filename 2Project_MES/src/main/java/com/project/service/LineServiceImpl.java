package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.LineDAO;
import com.project.domain.LineDTO;
import com.project.domain.PageDTO;

@Service
public class LineServiceImpl implements LineService{
	
	@Inject
	private LineDAO lineDAO;
	
	@Override
	public List<LineDTO> getlineList(PageDTO pageDTO) {
		System.out.println("LineServiceLmpl getlineList()");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		return lineDAO.getLineList(pageDTO);
	}

	@Override
	public int getLineCount() {
		System.out.println("LineServiceLmpl getlineCount()");
		
		return lineDAO.getLineCount();
	}

}
