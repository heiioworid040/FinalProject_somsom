package com.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

//	@RequestMapping(value = "/line/lineModal", method = RequestMethod.GET)
//	public String getLineList(@RequestBody LineDTO lineDTO, HttpServletRequest request, Model model) throws Exception {
//		System.out.println("lineController getLineList()");
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
//		
//		return null;
//	}	
	@ResponseBody
	@RequestMapping(value = "/line/lineModal", method = RequestMethod.GET)
	public List<LineDTO> getLineModal() {
		System.out.println("LineController getLineModal");
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(5);
		pageDTO.setPageNum("1");
		pageDTO.setCurrentPage(1);
		
		// 디비 최근글 5개 가져오기
		List<LineDTO> lineList=lineService.getlineList(pageDTO);
		//출력 결과 ResponseEntity 저장 => 되돌아감
		System.out.println(lineList.get(0).getLine_cd());
		return lineList;
	}
}