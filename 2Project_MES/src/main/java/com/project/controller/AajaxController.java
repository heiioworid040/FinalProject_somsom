package com.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.LineDTO;
import com.project.domain.PageDTO;
import com.project.service.LineService;

@RestController
public class AajaxController {
	@Inject
	private LineService lineService;
	
	@RequestMapping(value = "/ajax/lineModal", method = RequestMethod.GET)
	public ResponseEntity<List<LineDTO>> getLineModal() {
		System.out.println("LineController getLineModal");
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(5);
		pageDTO.setPageNum("1");
		pageDTO.setCurrentPage(1);
		
		// 디비 최근글 5개 가져오기
		List<LineDTO> lineList=lineService.getlineList(pageDTO);
		//출력 결과 ResponseEntity 저장 => 되돌아감
		ResponseEntity<List<LineDTO>> lineListE=
				new ResponseEntity<List<LineDTO>>(lineList, HttpStatus.OK);
		System.out.println(lineList.get(0).getLine_cd());
		return lineListE;
	}
}