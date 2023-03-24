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
	
//	@RequestMapping(value = "/code/codeList", method = RequestMethod.GET)
//	public String codeGrpList(HttpServletRequest request, Model model) {
//		System.out.println("codeController codeGrpList()");
//		
//		String code_grp = request.getParameter("code_grp");
//		System.out.println("code_grp="+code_grp);
//		
//		if(code_grp==null) {
//			int pageSize=10;
//			String pageNum = request.getParameter("pageNum");
//			if(pageNum==null) {
//				pageNum="1";
//			}
//			
//			int currentPage=Integer.parseInt(pageNum);
//			
//			PageDTO pageDTO = new PageDTO();
//			pageDTO.setPageSize(pageSize);
//			pageDTO.setPageNum(pageNum);
//			pageDTO.setCurrentPage(currentPage);
//			
//			List<CodeDTO> codeGrpList = codeService.getCodeGrpList(pageDTO);
//			
//			int count = codeService.getCodeGrpCount();
//			int pageBlock=10;
//			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//			int endPage=startPage+pageBlock-1;
//			int pageCount=count/pageSize+(count%pageSize==0?0:1);
//			if(endPage > pageCount){
//				endPage = pageCount;
//			}
//			
//			pageDTO.setCount(count);
//			pageDTO.setPageBlock(pageBlock);
//			pageDTO.setStartPage(startPage);
//			pageDTO.setEndPage(endPage);
//			pageDTO.setPageCount(pageCount);
//			
//			model.addAttribute("codeGrpList", codeGrpList);
//			model.addAttribute("pageDTO", pageDTO);
//			
//			return "code/codeList";
//		}
//		
//		else {
//			int pageSize=10;
//			String pageNum = request.getParameter("pageNum");
//			if(pageNum==null) {
//				pageNum="1";
//			}
//			
//			int currentPage=Integer.parseInt(pageNum);
//			
//			PageDTO pageDTO = new PageDTO();
//			pageDTO.setPageSize(pageSize);
//			pageDTO.setPageNum(pageNum);
//			pageDTO.setCurrentPage(currentPage);
//			
//			List<CodeDTO> codeList = codeService.getCodeList(pageDTO);
//			
//			int count = codeService.getCodeCount();
//			int pageBlock=10;
//			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//			int endPage=startPage+pageBlock-1;
//			int pageCount=count/pageSize+(count%pageSize==0?0:1);
//			if(endPage > pageCount){
//				endPage = pageCount;
//			}
//			
//			pageDTO.setCount(count);
//			pageDTO.setPageBlock(pageBlock);
//			pageDTO.setStartPage(startPage);
//			pageDTO.setEndPage(endPage);
//			pageDTO.setPageCount(pageCount);
//			
//			model.addAttribute("codeList", codeList);
//			model.addAttribute("pageDTO", pageDTO);
//			System.out.println("codeList"+codeList);
//			
//			return "code/codeList";
//		}
//	}
	

	

	@RequestMapping(value = "/code/codeList", method = RequestMethod.GET)
	public String codeGrpList(HttpServletRequest request, Model model) {
		
//		String code_grp = request.getParameter("code_grp");
//		System.out.println("code_grp="+code_grp);
//		model.addAttribute("code_grp", code_grp);
		
		
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
		System.out.println("codeGrpList"+codeGrpList);
		
		return "code/codeList";
	}
	
	@RequestMapping(value = "/code/codeList2", method = RequestMethod.GET)
	public String codeList(HttpServletRequest request, Model model) {
		System.out.println("codeController codeList()");
		
		String code_grp = request.getParameter("code_grp");
		System.out.println("code_grp="+code_grp);
		List<CodeDTO> codeList2 = codeService.getCodeList2(code_grp);
		
		
		
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
		
		List<CodeDTO> codeList = codeService.getCodeList(pageDTO);
		int count = codeService.getCodeCount();
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
		
		model.addAttribute("codeList", codeList);
		model.addAttribute("pageDTO", pageDTO);
		System.out.println("codeList"+codeList);
		
		return "code/codeList2";
	}
	
	
}