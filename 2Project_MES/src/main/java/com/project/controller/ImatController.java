package com.project.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.ImatDTO;
import com.project.service.ImatService;

@Controller
public class ImatController {
	private ImatService ImatService;
	
	@Inject
	public void setIn_materialService(ImatService imatService) {
		this.ImatService = imatService;
	}
	
	@RequestMapping(value = "/imat/imatbeList", method = RequestMethod.GET)
	public String getimatbeList() {
		return "imat/imatbeList";
	}
	
	@RequestMapping(value = "/imat/imatbeListPro", method = RequestMethod.POST)
	public String getInfoImatPro(ImatDTO ImatDTO) {
		System.out.println("ImatController getimatbeListPro()");
		System.out.println(ImatDTO.getImat_cd());
		
		return "redirect:/imat/imatbeList";
	}
	
	
}
