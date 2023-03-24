package com.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.CodeDTO;
import com.project.domain.PageDTO;
import com.project.service.CodeService;

@Controller
public class CodeController {

	@Inject
	private CodeService codeService;
	
	@RequestMapping(value = "/code/codeList", method = RequestMethod.GET)
	public String codeList(HttpServletRequest request, Model model) {
		System.out.println("codeController codeGrpList()");
		
		int pageSize=10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<CodeDTO> codeGrpList = codeService.getCodeGrpList(pageDTO);
		
		int count = codeService.getCodeGrpCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("codeGrpList", codeGrpList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "code/codeList";
	}
	
}
