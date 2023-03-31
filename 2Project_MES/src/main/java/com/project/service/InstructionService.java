package com.project.service;

import java.util.List;

import com.project.domain.PageDTO;
import com.project.domain.InstructionDTO;

public interface InstructionService {
	public List<InstructionDTO> getInstList(PageDTO pageDTO);

	public int getInstCount(PageDTO pageDTO);

	public void insertInst(InstructionDTO instructionDTO);
}
