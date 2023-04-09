package com.project.dao;

import java.util.List;

import com.project.domain.PageDTO;
import com.project.domain.PerformanceDTO;
import com.project.domain.ProductDTO;

public interface PerformanceDAO {
	public List<PerformanceDTO> performanceCurrentInfo(PageDTO pageDTO);

	// 검색어
	public int performanceCurrentCount(PageDTO pageDTO);

	public List<PerformanceDTO> perfCurrJsonList(PerformanceDTO performanceDTO);

	public List<ProductDTO> getProductInfo(PageDTO pageDTO);

	public int getProductCount(PageDTO pageDTO);

	public void insertPerf(PerformanceDTO performanceDTO);

	public Integer getMaxPerf();

	public void updatePerf(PerformanceDTO performanceDTO);

	public void deletePerf(String perf_cd);
}
