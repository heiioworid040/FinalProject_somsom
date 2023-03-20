package com.project.dao;

import java.util.List;

import com.project.domain.PageDTO;
import com.project.domain.WiDTO;

public interface WiDAO {
	
	public List<WiDTO> getWiList(PageDTO pageDTO);
	
	public int getWiCount();
	
	public void getInfoWi(WiDTO wiDTO);
	
	
}
