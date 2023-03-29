package com.project.dao;

import java.util.List;

import com.project.domain.PageDTO;
import com.project.domain.PerformanceDTO;

public interface PerformanceDAO {
	public List<PerformanceDTO> performanceCurrentInfo(PageDTO pageDTO);

	// 검색어
	public int performanceCurrentCount(PageDTO pageDTO);

	public List<PerformanceDTO> perfCurrJsonList(String prod_cd);
}
