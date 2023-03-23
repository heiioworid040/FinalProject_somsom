package com.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.PageDTO;
import com.project.domain.InstructionDTO;
import com.project.service.InstructionService;

@Controller
public class InstructionController {
	private InstructionService instService;
	
	@Inject
	public void setInstService(InstructionService instService) {
		this.instService = instService;
	}

	@RequestMapping(value = "/instruction/infoInst", method = RequestMethod.GET)
	public String getInfoInst(HttpServletRequest request, Model model) {
		System.out.println("testController getInfoInst()");
		int pageSize=10;
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<InstructionDTO> instList=instService.getInstList(pageDTO);
		
		int count = instService.getInstCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("instList", instList);
		
		return "instruction/infoInstruction";
	}
	
}
