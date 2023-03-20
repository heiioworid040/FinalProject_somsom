package com.project.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.WiDTO;
import com.project.service.WiService;

@Controller
public class WiController {
	private WiService wiService;
	
	@Inject
	public void setWiService(WiService wiService) {
		this.wiService = wiService;
	}
	
	@RequestMapping(value = "/wi/infoWi", method = RequestMethod.GET)
	public String getInfoWi() {
		return "wi/infoWi";
	}
	
	@RequestMapping(value = "/wi/infoWiPro", method = RequestMethod.POST)
	public String getInfoWiPro0(WiDTO wiDTO) {
		System.out.println("testController getInfoWiPro()");
		System.out.println(wiDTO.getInst_cd());
		
		return "redirect:/Wi/InfoWi";
	}
}
