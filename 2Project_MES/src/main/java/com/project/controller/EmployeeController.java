package com.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.EmployeeDTO;
import com.project.service.EmployeeService;


@Controller
public class EmployeeController {
	
	@Inject
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/employee/login", method = RequestMethod.GET)
	public String login() {

		return "employee/login";
	}
	
	@RequestMapping(value = "/employee/loginPro", method = RequestMethod.POST)
	public String loginPro(EmployeeDTO employeeDTO, HttpSession session) {
		System.out.println("EmployeeController loginPro()");
		
		EmployeeDTO employeeDTO2 = employeeService.userCheck(employeeDTO);		
		
		if(employeeDTO2 != null) {
			System.out.println("아이디 비밀번호 일치");
			session.setAttribute("emp_cd", employeeDTO.getEmp_cd());
			return "redirect:/employee/login";
		}else {
			System.out.println("아이디 비밀번호 틀림");
			return "employee/msg";
		}		
	}
	
	@RequestMapping(value = "/employee/employee", method = RequestMethod.GET)
	public String employee() {

		return "employee/employee";
	}
}
