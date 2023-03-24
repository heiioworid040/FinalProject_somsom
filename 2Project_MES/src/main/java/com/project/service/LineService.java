package com.project.service;

import java.util.List;

import com.project.domain.LineDTO;
import com.project.domain.PageDTO;

public interface LineService {
	public List<LineDTO> getlineList(PageDTO pageDTO); 
	
	public int getLineCount();
}
