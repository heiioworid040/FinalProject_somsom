package com.project.controller;


import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String getLineInfo() {
		System.out.println("lineController getInfoInst()");
		
		return "line/linePop";
	}
	
	@RequestMapping(value = "/line/lineModalJson", method = RequestMethod.GET)
	public String getLineModal(HttpServletRequest request, Model model) {
		System.out.println("lineController getLineModal()");
		int pageSize=5;
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		ArrayList<LineDTO> linList= lineService.getlineList(pageDTO);
		return "line/linePop";
	}
}
