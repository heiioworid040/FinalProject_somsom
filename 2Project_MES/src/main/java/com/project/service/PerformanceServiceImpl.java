package com.project.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.PerformanceDAO;
import com.project.domain.PageDTO;
import com.project.domain.PerformanceDTO;
import com.project.domain.ProductDTO;

@Service
public class PerformanceServiceImpl implements PerformanceService {

	@Inject
	private PerformanceDAO performanceDAO;

	@Override
	public List<PerformanceDTO> performanceCurrentInfo(PageDTO pageDTO) {
		System.out.println("PerformanceServiceImpl performanceCurrentInfo()");
		// 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;

		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);

		return performanceDAO.performanceCurrentInfo(pageDTO);
	}

	// 검색어
	@Override
	public int performanceCurrentCount(PageDTO pageDTO) {
		System.out.println("PerformanceServiceImpl performanceCurrentCount()");

		return performanceDAO.performanceCurrentCount(pageDTO);
	}

	@Override
	public List<PerformanceDTO> perfCurrJsonList(PerformanceDTO performanceDTO) {
		System.out.println("PerformanceServiceImpl perfCurrJsonList()");

		return performanceDAO.perfCurrJsonList(performanceDTO);
	}

	@Override
	public List<ProductDTO> getProductInfo(PageDTO pageDTO) {
		System.out.println("PerformanceServiceImpl getProductInfo()");
		// 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;

		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);

		return performanceDAO.getProductInfo(pageDTO);
	}

	@Override
	public int getProductCount(PageDTO pageDTO) {
		System.out.println("PerformanceServiceImpl getProductCount()");

		return performanceDAO.getProductCount(pageDTO);
	}

	@Override
	public void insertPerf(PerformanceDTO performanceDTO) {
		System.out.println("PerformanceServiceImpl insertPerf()");
		System.out.println(performanceDTO.getInst_cd());
		if(performanceDAO.getMaxPerf() == null) {
			performanceDTO.setPerf_cd("WP001");
		}else if(performanceDAO.getMaxPerf()<10){
			performanceDTO.setPerf_cd("WP00"+performanceDAO.getMaxPerf());
		}else if(performanceDAO.getMaxPerf()>9 && performanceDAO.getMaxPerf()<100){
			performanceDTO.setPerf_cd("WP0"+performanceDAO.getMaxPerf());
		}else {
			performanceDTO.setPerf_cd("WP"+performanceDAO.getMaxPerf());
		}
		performanceDTO.setPerf_date(new Timestamp(System.currentTimeMillis()));

		performanceDAO.insertPerf(performanceDTO);
	}

	@Override
	public void updatePerf(PerformanceDTO performanceDTO) {
		System.out.println("PerformanceServiceImpl updatePerf()");
		
		performanceDAO.updatePerf(performanceDTO);
	}

	

}
