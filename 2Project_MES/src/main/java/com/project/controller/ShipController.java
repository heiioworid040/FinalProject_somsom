package com.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.PageDTO;
import com.project.domain.ShipDTO;
import com.project.service.ShipService;

@Controller
public class ShipController {

	@Inject
	private ShipService shipService;

	@RequestMapping(value = "/ship/shipCurrentInfo", method = RequestMethod.GET)
	public String currentInfo(HttpServletRequest request, Model model) {
		System.out.println("ShipController currentInfo()");
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

		List<ShipDTO> shipCurrentInfo = shipService.shipCurrentInfo(pageDTO);

		// 페이징 처리
		int count = shipService.shipCurrentCount();
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

		model.addAttribute("shipCurrentInfo", shipCurrentInfo);
		model.addAttribute("pageDTO", pageDTO);
		// 주소변경 없이 이동
		return "ship/shipCurrentInfo";
	}
}
