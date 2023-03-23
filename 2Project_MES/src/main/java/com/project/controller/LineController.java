package com.project.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LineController {
	
	@RequestMapping(value = "/line/linePop", method = RequestMethod.GET)
	public String getLineInfo() {
		System.out.println("lineController getInfoInst()");
		
		return "line/linePop";
	}
}
