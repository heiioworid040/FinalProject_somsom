package com.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.CodeDTO;
import com.project.domain.LineDTO;
import com.project.domain.PageDTO;
import com.project.service.CodeService;
import com.project.service.LineService;

@RestController
public class AajaxController {
	@Inject
	private LineService lineService;
	
	@Inject
	private CodeService codeService;
	
	
	@RequestMapping(value = "/ajax/lineModal", method = RequestMethod.GET)
	public ResponseEntity<List<LineDTO>> getLineModal(HttpServletRequest request) {
		System.out.println("LineController getLineModal");
		int pageSize=10;
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(5);
		pageDTO.setPageNum("1");
		pageDTO.setCurrentPage(1);
		
		// 디비 최근글 5개 가져오기
		List<LineDTO> lineList=lineService.getlineList(pageDTO);
		
		int count = lineService.getLineCount();
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
		
		//출력 결과 ResponseEntity 저장 => 되돌아감
		ResponseEntity<List<LineDTO>> lineListE=
				new ResponseEntity<List<LineDTO>>(lineList, HttpStatus.OK);
		System.out.println(lineList.get(0).getLine_cd());
		return lineListE;
	}

	@RequestMapping(value = "/code/listjson", method = RequestMethod.GET)
	public ResponseEntity<List<CodeDTO>> listjson(HttpServletRequest request) {
		
		String code_grp = request.getParameter("code_grp");
		List<CodeDTO> codeList3=codeService.getCodeList3(code_grp);
		
		//출력 결과 ResponseEntity 저장 => 되돌아감
		ResponseEntity<List<CodeDTO>> entity=
				new ResponseEntity<List<CodeDTO>>(codeList3,HttpStatus.OK);
		
		return entity;
	}
	
	
	
	
}
	
	
	
	
