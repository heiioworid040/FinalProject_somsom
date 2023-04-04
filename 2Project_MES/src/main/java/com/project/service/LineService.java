package com.project.service;

import java.util.List;

import com.project.domain.LineDTO;
import com.project.domain.PageDTO;

public interface LineService {
	List<LineDTO> getSearchLine();

	List<LineDTO> getLineList(PageDTO pageDTO);

	int getLineCount();
}
