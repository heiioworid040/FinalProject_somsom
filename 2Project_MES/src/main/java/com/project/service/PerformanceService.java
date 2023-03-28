package com.project.service;

import java.util.List;

import com.project.domain.PageDTO;
import com.project.domain.PerformanceDTO;

public interface PerformanceService {
	public List<PerformanceDTO> performanceCurrentInfo(PageDTO pageDTO);

	public int performanceCurrentCount();

	public List<PerformanceDTO> perfCurrJsonList(String prod_cd);
}
