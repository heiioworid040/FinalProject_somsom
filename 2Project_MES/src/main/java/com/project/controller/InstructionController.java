package com.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String getInfoInst(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("instructionController getInfoInst()");
		
		String searchLineCd=request.getParameter("searchLineCd");
		String searchOrdDate1 =request.getParameter("searchOrdDate1");
		String searchOrdDate2 =request.getParameter("searchOrdDate2");
		String searchProdCd =request.getParameter("searchProdCd");
		String searchInstSt1;
		String searchInstSt2;
		String searchInstSt3;
		if(searchLineCd==null) {
			searchInstSt1 ="대기";
			searchInstSt2 ="진행";
			searchInstSt3 ="완료";		
		}else{
			searchInstSt1 =request.getParameter("searchInstSt1");
			searchInstSt2 =request.getParameter("searchInstSt2");
			searchInstSt3 =request.getParameter("searchInstSt3");
		}
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
		
		pageDTO.setSearch(searchLineCd);
		pageDTO.setSearch2(searchOrdDate1);
		pageDTO.setSearch3(searchOrdDate2);
		pageDTO.setSearch4(searchProdCd);
		pageDTO.setSearch5(searchInstSt1);
		pageDTO.setSearch6(searchInstSt2);
		pageDTO.setSearch7(searchInstSt3);
		
		System.out.println("대기"+pageDTO.getSearch5() );
		List<InstructionDTO> instList=instService.getInstList(pageDTO);

		int count = instService.getInstCount();
		System.out.println("st"+searchInstSt1 );
		System.out.println("st"+searchInstSt2 );
		System.out.println("st"+searchInstSt3 );
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=(count/pageSize)+(count%pageSize==0?0:1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("페이지 카운트"+pageCount);
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		
		model.addAttribute("instList", instList);
		model.addAttribute("pageDTO", pageDTO);
		System.out.println(count);
		System.out.println(pageCount);
		System.out.println("시작"+startPage);
		System.out.println("현재"+currentPage);
		System.out.println("엔드"+endPage);
		System.out.println(pageDTO.getStartRow());
		return "instruction/infoInstruction";
	}
	
	@RequestMapping(value = "/instruction/insertInst", method = RequestMethod.POST)
	public String insertInstPro(InstructionDTO instructionDTO) {
		System.out.println("instructionController insertInstPro()");
		instService.insertInst(instructionDTO);
		
		return "redirect:/instruction/infoInst";
	}
	
	@RequestMapping(value = "/instruction/updateInst", method = RequestMethod.POST)
	public String updateInstPro(InstructionDTO instructionDTO) {
		System.out.println("instructionController updateInstPro()");
		System.out.println(instructionDTO.getLine_cd());
		System.out.println(instructionDTO.getInst_count());
		System.out.println(instructionDTO.getInst_st());
		
		instService.updateInst(instructionDTO);
		return "redirect:/instruction/infoInst";
	}
	
}
