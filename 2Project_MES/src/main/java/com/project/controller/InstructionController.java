package com.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.InstructionDTO;
import com.project.domain.LineDTO;
import com.project.domain.PageDTO;
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
		System.out.println("instructionController getInfoInst()");
		System.out.println(request.getParameter("searchInst"));
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

		System.out.println("대기2"+pageDTO.getSearch5() );
		System.out.println("진행2"+pageDTO.getSearch6() );
		System.out.println("완료2"+pageDTO.getSearch7() );
		List<InstructionDTO> instList=instService.getInstList(pageDTO);

		int count = instService.getInstCount(pageDTO);
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

	@RequestMapping(value = "/instruction/deleteInst", method = RequestMethod.GET)
	public String deleteInstPro(HttpServletRequest request, String inst_cd) {
		System.out.println("instructionController deleteInstPro()");
		System.out.println(request.getParameter("delInstCd"));
		inst_cd=request.getParameter("delInstCd");
		instService.deleteInst(inst_cd);
		
		return "redirect:/instruction/infoInst";
	}
	
	@RequestMapping(value = "/instruction/instructionPop", method = RequestMethod.GET)
	public String getLinePop(HttpServletRequest request, PageDTO pageDTO, Model model) {
		System.out.println("xinstructionController instructionPop()");
		
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
		int pageSize=5;

		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);


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

		List<InstructionDTO> instList=instService.getInstList(pageDTO);

		int count = instService.getInstCount(pageDTO);
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=(count/pageSize)+(count%pageSize==0?0:1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);


		model.addAttribute("instList", instList);
		model.addAttribute("pageDTO", pageDTO);

		return "instruction/instructionPop";
	}
	@RequestMapping(value = "/instruction/instClickTr", method = RequestMethod.GET)
	public String instClickTr(HttpServletRequest request, InstructionDTO instructionDTO, Model model) {
		System.out.println("instructionController instClickTr()");
		System.out.println(request.getParameter("clickInstCd"));
		String inst_cd=request.getParameter("clickInstCd");
		instService.getInst(inst_cd);

		model.addAttribute("instructionDTO", instructionDTO);
		return "performance/performanceCurrentInfo";
	}
	
	

}