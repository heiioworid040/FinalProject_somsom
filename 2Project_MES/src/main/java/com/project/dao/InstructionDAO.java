package com.project.dao;

import java.util.List;

import com.project.domain.InstructionDTO;
import com.project.domain.PageDTO;

public interface InstructionDAO {

	public List<InstructionDTO> getInstList(PageDTO pageDTO);

	public int getInstCount();

	public void insertInst(InstructionDTO instructionDTO);

	public Integer getMaxInst();

	public void updateInst(InstructionDTO instructionDTO);

	public InstructionDTO getInst(String inst_cd);

	public void deletInst(String inst_cd);

}
