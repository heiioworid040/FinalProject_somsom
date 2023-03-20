package com.project.service;

import java.util.List;

import com.project.domain.PageDTO;
import com.project.domain.WiDTO;

public interface WiService {
	public List<WiDTO> getWiList(PageDTO pageDTO);

	public int getWiCount();
	
}
