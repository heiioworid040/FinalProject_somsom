package com.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.ImatDTO;
import com.project.domain.PageDTO;
import com.project.service.ImatService;


@Controller
public class ImatController {
	private ImatService ImatService;
	
	@Inject
	public void setIn_materialService(ImatService imatService) {
		this.ImatService = imatService;
	}
	
//	@RequestMapping(value = "/imat/imatbeListPro", method = RequestMethod.POST)
//	public String getInfoImatPro(ImatDTO imatDTO) {
//		System.out.println("ImatController getimatbeListPro()");
//		ImatService.getImat(imatDTO);
//		return "redirect:/imat/imatbeList";
//	}
	
	@RequestMapping(value = "/imat/imatbeList", method = RequestMethod.GET)
	public String ImatbeList(HttpServletRequest request, Model model) {
		System.out.println("ImatController ImatbeList()");
		
		int pageSize=10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		System.out.println("ImatController ImatbeList()-1");
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		System.out.println("ImatController ImatbeList()-2");
		List<ImatDTO> imatbeList = ImatService.getImatbeList(pageDTO);
		
		int count = ImatService.getImatCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		System.out.println("ImatController ImatbeList()-3");
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("ImatbeList", imatbeList);
		model.addAttribute("pageDTO", pageDTO);
		System.out.println("ImatController ImatbeList()-4");
		System.out.println("ImatController ImatbeList()-4"+imatbeList.get(0).getImat_cd());
		System.out.println("ImatController ImatbeList()-4"+imatbeList.get(0).getImat_date());
		return "imat/imatbeList";
	}
}
