package com.project.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.PageDTO;
import com.project.domain.InstructionDTO;
import com.project.domain.LineDTO;
import com.project.service.InstructionService;
import com.project.service.LineService;

@Controller
public class InstructionController {
	private InstructionService instService;
	private LineService lineService;
	
	@Inject
	public void setInstService(InstructionService instService) {
		this.instService = instService;
	}
	@Inject
	public void setLineService(LineService lineService) {
		this.lineService = lineService;
	}

	@RequestMapping(value = "/instruction/infoInst", method = RequestMethod.GET)
	public String getInfoInst(HttpServletRequest request, Model model,  Model model2) {
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
//		라인 검색 옵션
		List<LineDTO> searchLine=lineService.getSearchLine();
		model2.addAttribute("searchLine", searchLine);
		
		return "instruction/infoInstruction";
	}
	
	@RequestMapping(value = "/instruction/instinsert", method = RequestMethod.POST)
	public String instInsertPro(HttpServletRequest request, HttpServletResponse response, InstructionDTO instructionDTO) {
		int maxInst=instService.maxInst();
		Timestamp date=new Timestamp(System.currentTimeMillis());
		
		instructionDTO.setInst_cd("Wi"+maxInst);
		instructionDTO.setInst_st("대기");
		instructionDTO.setInst_date(date);
		instructionDTO.setInst_count(Integer.parseInt(request.getParameter("inst_count")));
		instService.insertInst(instructionDTO);
		
		return "redirect:/instruction/infoInst";
	}
}
