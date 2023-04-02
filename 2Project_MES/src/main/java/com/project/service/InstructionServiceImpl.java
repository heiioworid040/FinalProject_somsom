package com.project.service;

import java.sql.Timestamp;
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
	public int getInstCount(PageDTO pageDTO) {
		System.out.println("InstserviceImpl getInstCount()");
		
		return instDAO.getInstCount(pageDTO);
	}

	@Override
	public void insertInst(InstructionDTO instructionDTO) {
		System.out.println("InstserviceImpl insertInst()");
		if(instDAO.getMaxInst() == 1) {
			instructionDTO.setInst_cd("Wi001");
		}else if(instDAO.getMaxInst()<10){
			instructionDTO.setInst_cd("Wi"+00+instDAO.getMaxInst());
		}else if(instDAO.getMaxInst()<100){
			instructionDTO.setInst_cd("Wi"+0+instDAO.getMaxInst());
		}else {
			instructionDTO.setInst_cd("Wi"+instDAO.getMaxInst());		
		}
		System.out.println(instructionDTO.getLine_cd());
		instructionDTO.setInst_st("대기");
		instructionDTO.setInst_date(new Timestamp(System.currentTimeMillis()));
		
		instDAO.insertInst(instructionDTO);
	}


	
}
