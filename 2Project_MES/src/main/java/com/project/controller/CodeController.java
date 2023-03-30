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
	public String codeGrpList(HttpServletRequest request, Model model) {

		String plus = request.getParameter("plus");
		System.out.println("plus"+plus);
		String code_grp = request.getParameter("code_grp");
		System.out.println("code_grp="+code_grp);
		
		CodeDTO codeDTO = new CodeDTO();
		
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
		
		model.addAttribute("codeDTO", codeDTO);
		model.addAttribute("codeGrpList", codeGrpList);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("code_grp", code_grp);
		
		if(plus!=null) {
			model.addAttribute(plus);
			List<CodeDTO> codeList2 = codeService.getCodeList2(code_grp);
			model.addAttribute("codeList2", codeList2);		
		}
				
		return "code/codeList";
	
		
	}
	
	
	@RequestMapping(value = "/code/codeList2", method = RequestMethod.GET)
	public String codeList2(HttpServletRequest request, Model model) {
		System.out.println("codeController codeList()");
		
		
		String code_grp = request.getParameter("code_grp");
		System.out.println("code_grp="+code_grp);
		
		List<CodeDTO> codeList2 = codeService.getCodeList2(code_grp);
				
		model.addAttribute("codeList2", codeList2);
		model.addAttribute("code_grp", code_grp);
		
		return "code/codeList2";
	}
	

	
	@RequestMapping(value = "/code/deletePro", method = RequestMethod.POST)
	public String deletetPro(HttpServletRequest request) {
		System.out.println("CodeController deletePro");
		
		String[] code_cd = request.getParameterValues("ck");
		
		System.out.println("code_cd="+code_cd);
			for(int i=0;i<code_cd.length;i++) {		
			System.out.println(code_cd);
			codeService.deleteCode(code_cd[i]);			
			}
			
		return "redirect:" + request.getHeader("Referer");			
	}
	
	
	@RequestMapping(value = "/code/updateCode", method = RequestMethod.GET)
	public String updateCode(Model model, HttpServletRequest request) {
		System.out.println("CodeController updateCode()");
		
		String code_cd = request.getParameter("code_cd");
		System.out.println("code_cd="+code_cd);
		
		CodeDTO codeDTO = codeService.getCode2(code_cd);
		
		model.addAttribute("codeDTO", codeDTO);
		
		return "code/updateCode";
	}
	
	@RequestMapping(value = "/code/updatePro", method = RequestMethod.POST)
	public String updatePro(CodeDTO codeDTO, HttpServletRequest request) {
		System.out.println("CodeController updatePro()");
		
		codeService.updateCode(codeDTO);

//		주소줄 변경하면서 이동 (수정해야함)
		return "redirect:/code/codeList2";
	}
	
	
	@RequestMapping(value = "/code/insertCode", method = RequestMethod.GET)
	public String insertCode(HttpServletRequest request, Model model) {
		System.out.println("CodeController insertCode()");
		
		String code_grp = request.getParameter("code_grp");
		System.out.println("code_grp:"+code_grp);
		
		CodeDTO codeDTO = codeService.getCode(code_grp);
		
		model.addAttribute("codeDTO", codeDTO);
		model.addAttribute("code_grp", code_grp);
		return "code/insertCode";
	}
	

	

	
	//리스트2 페이징
//	@RequestMapping(value = "/code/codeList2", method = RequestMethod.GET)
//	public String codeList2(HttpServletRequest request, Model model) {
//		System.out.println("codeController codeList()");
//		
//		String code_grp = request.getParameter("code_grp");
//		System.out.println("code_grp="+code_grp);
//		List<CodeDTO> codeList2 = codeService.getCodeList2(code_grp);
//		
//		int pageSize=10;
//		String pageNum = request.getParameter("pageNum");
//		if(pageNum==null) {
//			pageNum="1";
//		}
//		
//		int currentPage=Integer.parseInt(pageNum);
//		
//		PageDTO pageDTO = new PageDTO();
//		pageDTO.setPageSize(pageSize);
//		pageDTO.setPageNum(pageNum);
//		pageDTO.setCurrentPage(currentPage);
//		
//		List<CodeDTO> codeList = codeService.getCodeList(pageDTO);
//		int count = codeService.getCodeCount();
//		int pageBlock=10;
//		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//		int endPage=startPage+pageBlock-1;
//		int pageCount=count/pageSize+(count%pageSize==0?0:1);
//		if(endPage > pageCount){
//			endPage = pageCount;
//		}
//		
//		pageDTO.setCount(count);
//		pageDTO.setPageBlock(pageBlock);
//		pageDTO.setStartPage(startPage);
//		pageDTO.setEndPage(endPage);
//		pageDTO.setPageCount(pageCount);
//		
//		model.addAttribute("codeList2", codeList2);
//		model.addAttribute("codeList", codeList);
//		model.addAttribute("pageDTO", pageDTO);
//		System.out.println("codeList"+codeList);
//		
//		return "code/codeList2";
//	}
	
	

//	합치는거
	
//	@RequestMapping(value = "/code/codeList", method = RequestMethod.GET)
//	public String codeGrpList(HttpServletRequest request, Model model) {
//		
//		int pageSize=10;
//		String pageNum = request.getParameter("pageNum");
//		if(pageNum==null) {
//			pageNum="1";
//		}
//		
//		int currentPage=Integer.parseInt(pageNum);
//		
//		PageDTO pageDTO = new PageDTO();
//		pageDTO.setPageSize(pageSize);
//		pageDTO.setPageNum(pageNum);
//		pageDTO.setCurrentPage(currentPage);
//		
//		List<CodeDTO> codeGrpList = codeService.getCodeGrpList(pageDTO);
//		
//		int count = codeService.getCodeGrpCount();
//		int pageBlock=10;
//		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//		int endPage=startPage+pageBlock-1;
//		int pageCount=count/pageSize+(count%pageSize==0?0:1);
//		if(endPage > pageCount){
//			endPage = pageCount;
//		}
//		
//		pageDTO.setCount(count);
//		pageDTO.setPageBlock(pageBlock);
//		pageDTO.setStartPage(startPage);
//		pageDTO.setEndPage(endPage);
//		pageDTO.setPageCount(pageCount);
//		
//		model.addAttribute("codeGrpList", codeGrpList);
//		model.addAttribute("pageDTO", pageDTO);
//		
//
//		
//		String plus = request.getParameter("plus");
//		System.out.println("plus"+plus);
//
////		String code_grp = request.getParameter("code_grp");
////		System.out.println("code_grp="+code_grp);
////		model.addAttribute("code_grp", code_grp);
//		
////		System.out.println("codeGrpList"+codeGrpList);
////		CodeDTO codeDTO = codeService.getCode(code_grp);
////		model.addAttribute("codeDTO", codeDTO);
//	
//		
//		
//		if(plus!=null) {
//			model.addAttribute("plus",plus);
//			String code_grp = request.getParameter("code_grp");
//			System.out.println("code_grp="+code_grp);
//			model.addAttribute("code_grp", code_grp);
//			System.out.println("code_grp="+code_grp);
//			List<CodeDTO> codeList2 = codeService.getCodeList2(code_grp);
//			model.addAttribute("codeList2", codeList2);
//
//		}
//		
//		
//		return "code/codeList3";
//	}
//	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}