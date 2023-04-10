package com.project.service;

import java.util.List;

import com.project.domain.InstructionDTO;
import com.project.domain.PageDTO;

public interface InstructionService {
	public List<InstructionDTO> getInstList(PageDTO pageDTO);

	public int getInstCount(PageDTO pageDTO);

	public void insertInst(InstructionDTO instructionDTO);

	public void updateInst(InstructionDTO instructionDTO);

	public InstructionDTO getInst(String inst_cd);

	public void deleteInst(String inst_cd);

}
