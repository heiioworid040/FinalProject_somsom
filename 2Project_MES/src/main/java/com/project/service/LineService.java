package com.project.service;

import java.util.List;

import com.project.domain.LineDTO;
import com.project.domain.PageDTO;

public interface LineService {
	public List<LineDTO> getLineList(PageDTO pageDTO);

	public int getLineCount(PageDTO pageDTO);

	public void insertLine(LineDTO lineDTO);

	public void updateLine(LineDTO lineDTO);

	public void deleteLine(String line_cd);
}
