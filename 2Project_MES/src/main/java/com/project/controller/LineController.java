package com.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.domain.LineDTO;
import com.project.domain.PageDTO;
import com.project.service.LineService;

@Controller
public class LineController {
	private LineService lineService;
	
	@Inject
	public void setLineService(LineService lineService) {
		this.lineService = lineService;
	}

	@RequestMapping(value = "/line/linePop", method = RequestMethod.GET)
//	public ModelAndView getLineModal() {
//		System.out.println("lineController getLineModalJson()");
//		int pageSize=5;
//		
//		String pageNum=request.getParameter("pageNum");
//		if(pageNum==null) {
//			pageNum="1";
//		}
//		int currentPage=Integer.parseInt(pageNum);
//		
//		PageDTO pageDTO=new PageDTO();
//		pageDTO.setPageSize(pageSize);
//		pageDTO.setPageNum(pageNum);
//		pageDTO.setCurrentPage(currentPage);
//		
//		List<LineDTO> lineList= lineService.getlineList(pageDTO);
//		
//		int count = lineService.getLineCount();
//		int pageBlock=10;
//		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//		int endPage=startPage+pageBlock-1;
//		int pageCount=count/pageSize+(count%pageSize==0?0:1);
//		if(endPage > pageCount) {
//			endPage = pageCount;
//		}
//		pageDTO.setCount(count);
//		pageDTO.setPageBlock(pageBlock);
//		pageDTO.setStartPage(startPage);
//		pageDTO.setEndPage(endPage);
//		pageDTO.setPageCount(pageCount);
//		
//		model.addAttribute("lineList", lineList);
//		return "line/linePop";
//	}
}
