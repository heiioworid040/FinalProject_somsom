package com.project.dao;

import java.util.List;

import com.project.domain.PageDTO;
import com.project.domain.InstructionDTO;

public interface InstructionDAO {
	
	public List<InstructionDTO> getInstList(PageDTO pageDTO);
	
	public int getInstCount();

	public void insertInst(InstructionDTO instructionDTO);

	public Integer getMaxInst();

	public void updateInst(InstructionDTO instructionDTO);

}
