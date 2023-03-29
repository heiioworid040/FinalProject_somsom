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
import com.project.domain.EmployeeDTO;
import com.project.domain.LineDTO;
import com.project.domain.PageDTO;
import com.project.service.CodeService;
import com.project.service.EmployeeService;
import com.project.service.LineService;

@RestController
public class AajaxController {
	@Inject
	private LineService lineService;
	
	@Inject
	private CodeService codeService;
	
	@Inject
	private EmployeeService employeeService;
	
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

	@RequestMapping(value = "/code/listjson", method = RequestMethod.GET)
	public ResponseEntity<List<CodeDTO>> listjson(HttpServletRequest request) {
		
		String code_grp = request.getParameter("code_grp");
		List<CodeDTO> codeList3=codeService.getCodeList3(code_grp);
		
		//출력 결과 ResponseEntity 저장 => 되돌아감
		ResponseEntity<List<CodeDTO>> entity=
				new ResponseEntity<List<CodeDTO>>(codeList3,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/employee/emailCk", method = RequestMethod.GET)
	public ResponseEntity<String> idCheck(HttpServletRequest request) {
		String result="";
		String emp_email=request.getParameter("emp_email");
		EmployeeDTO employeeDTO=employeeService.emailCk(emp_email);
		
		if(employeeDTO!=null) {
			result="emailUp";
		}else {
			result="emailOk";
		}
		
		ResponseEntity<String> entity=
				new ResponseEntity<String>(result,HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/employee/telCk", method = RequestMethod.GET)
	public ResponseEntity<String> telCk(HttpServletRequest request) {
		String result="";
		String emp_tel=request.getParameter("emp_tel");
		EmployeeDTO employeeDTO=employeeService.telCk(emp_tel);
		if(employeeDTO!=null) {
			result="telUp";
		}else {
			result="telOk";
		}
		ResponseEntity<String> entity=
				new ResponseEntity<String>(result,HttpStatus.OK);
		return entity;
	}
	
	
	
	
	
	
}
	
	
	
	
