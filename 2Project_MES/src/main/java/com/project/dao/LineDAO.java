package com.project.dao;

import java.util.List;

import com.project.domain.LineDTO;
import com.project.domain.PageDTO;

public interface LineDAO {

	public List<LineDTO> getLineList(PageDTO pageDTO);

	public int getLineCount();

}
