package com.project.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.InstructionDAO;
import com.project.domain.InstructionDTO;
import com.project.domain.PageDTO;

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
		System.out.println("InstserviceImpl insertInstPro()");
		if(instDAO.getMaxInst() == null) {
			instructionDTO.setInst_cd("WI001");
		}else if(instDAO.getMaxInst()<10){
			instructionDTO.setInst_cd("WI"+"00"+instDAO.getMaxInst());
		}else if(instDAO.getMaxInst()>9 && instDAO.getMaxInst()<100){
			instructionDTO.setInst_cd("WI"+"0"+instDAO.getMaxInst());
		}else {
			instructionDTO.setInst_cd("WI"+instDAO.getMaxInst());
		}
		instructionDTO.setInst_date(new Timestamp(System.currentTimeMillis()));

		instDAO.insertInst(instructionDTO);
	}

	@Override
	public void updateInst(InstructionDTO instructionDTO) {
		System.out.println("InstserviceImpl updateInstPro()");
		System.out.println(instructionDTO.getInst_cd());
		System.out.println(instructionDTO.getInst_st());

		instDAO.updateInst(instructionDTO);
	}

	@Override
	public InstructionDTO getInst(String inst_cd) {
		System.out.println("InstserviceImpl getInst()");

		return instDAO.getInst(inst_cd);
	}

	@Override
	public void deleteInst(String inst_cd) {
		System.out.println("InstserviceImpl deleteInst()");
		
		instDAO.deletInst(inst_cd);
	}
	
	



}
