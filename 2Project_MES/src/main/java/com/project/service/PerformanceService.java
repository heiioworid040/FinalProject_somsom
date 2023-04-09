package com.project.service;

import java.util.List;

import com.project.domain.PageDTO;
import com.project.domain.PerformanceDTO;
import com.project.domain.ProductDTO;

public interface PerformanceService {
	public List<PerformanceDTO> performanceCurrentInfo(PageDTO pageDTO);

	// 검색어
	public int performanceCurrentCount(PageDTO pageDTO);

	public List<PerformanceDTO> perfCurrJsonList(PerformanceDTO performanceDTO);

	public List<ProductDTO> getProductInfo(PageDTO pageDTO);

	public int getProductCount(PageDTO pageDTO);

	public void updatePerf(PerformanceDTO performanceDTO);

	public void insertPerf(PerformanceDTO performanceDTO);
}
