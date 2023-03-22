package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.InstructionDAO;
import com.project.domain.PageDTO;
import com.project.domain.InstructionDTO;

@Service
public class InstructionServiceImpl implements InstructionService{
	
	@Inject
	private InstructionDAO instDAO; 

	@Override
	public List<InstructionDTO> getInstList(PageDTO pageDTO) {
		System.out.println("InstserviceImpl getInstList()");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		return instDAO.getInstList(pageDTO);
	}

	@Override
	public int getInstCount() {
		System.out.println("InstserviceImpl getInstCount()");
		
		return instDAO.getInstCount();
	}

}
