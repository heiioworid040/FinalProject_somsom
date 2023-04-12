package com.project.dao;

import java.util.List;

import com.project.domain.LineDTO;
import com.project.domain.PageDTO;

public interface LineDAO {

	public List<LineDTO> getLineList(PageDTO pageDTO);

	public int getLineCount(PageDTO pageDTO);

	public void inertLine(LineDTO lineDTO);

	public Integer getMaxLine();

	public void updateLine(LineDTO lineDTO);

	public void deleteLine(String line_cd);



}
