package com.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.LineDTO;
import com.project.domain.PageDTO;
import com.project.domain.PerformanceDTO;
import com.project.service.LineService;
import com.project.service.PerformanceService;

@Controller
public class PerformanceController {

	@Inject
	private PerformanceService performanceService;

	@Inject
	private LineService lineService;

	// 생산실적 현황 목록
	@RequestMapping(value = "/performance/performanceCurrentInfo", method = RequestMethod.GET)
	public String currentInfo(HttpServletRequest request, Model model) {
		System.out.println("PerformanceController currentInfo()");
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 20;
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			// pageNum 없으면 1페이지 설정
			pageNum = "1";
		}
		// 페이지번호를 => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);

		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);

		List<PerformanceDTO> performanceCurrentInfo = performanceService.performanceCurrentInfo(pageDTO);

		// 페이징 처리
		int count = performanceService.performanceCurrentCount();
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		model.addAttribute("performanceCurrentInfo", performanceCurrentInfo);
		model.addAttribute("pageDTO", pageDTO);
		// 라인 검색 옵션 셀렉트박스 값 
		List<LineDTO> searchLine = lineService.getSearchLine();
		model.addAttribute("searchLine", searchLine);
		// 주소변경 없이 이동
		return "performance/performanceCurrentInfo";
	}

	// 생산실적 현황 json 리스트
	@ResponseBody
	@RequestMapping(value = "/performance/perfCurrJsonList", method = RequestMethod.GET)
	public List<PerformanceDTO> perfCurrJsonList(@RequestParam("prod_cd") String prod_cd) {
		List<PerformanceDTO> perfCurrJsonList = performanceService.perfCurrJsonList(prod_cd);

		return perfCurrJsonList;
	}

}
