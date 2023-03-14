package com.project.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.TestDTO;
import com.project.service.TestService;

@Controller
public class TestController {
	private TestService testService;
	
	@Inject
	public void setTestService(TestService testService) {
		this.testService = testService;
	}
	
	@RequestMapping(value = "/test/insert", method = RequestMethod.GET)
	public String insertTest() {
		return "test/insertTest";
	}
	
	@RequestMapping(value = "/test/insertPro", method = RequestMethod.POST)
	public String insertPro(TestDTO testDTO) {
		System.out.println("testController insertPro()");
		System.out.println(testDTO.getNum());
		System.out.println(testDTO.getName());
		
		testService.insertTest(testDTO);
		
		return "redirect:/test/insert";
	}
}
