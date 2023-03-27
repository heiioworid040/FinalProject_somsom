package com.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.ClientDTO;
import com.project.domain.EmployeeDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;
import com.project.service.ClientService;
import com.project.service.EmployeeService;
import com.project.service.ProductService;

@Controller
public class SearchController {
	
	@Inject
	private EmployeeService employeeService;

	@Inject
	private ClientService clientService;

	@Inject
	private ProductService productService;
	
	@RequestMapping(value = "/search/searchPop", method = RequestMethod.GET)
	public String searchPop(HttpServletRequest request, Model model) {
		String pop=(String)request.getParameter("pop");
		String cli=(String)request.getParameter("cli");
		String emp=(String)request.getParameter("emp");
		String prod=(String)request.getParameter("prod");
		
		
		int pageSize=10;
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) pageNum="1";
		int currentPage=Integer.valueOf(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setSearch(cli);
		pageDTO.setSearch2(emp);
		pageDTO.setSearch3(prod);
		
		int count=0;
		if(pop.equals("cli")) {
			List<ClientDTO> popList=clientService.getClientInfo(pageDTO);
			model.addAttribute("popList", popList);
			count=clientService.getClientCount();
		}else if(pop.equals("emp")) {
			List<EmployeeDTO> popList=employeeService.getEmployeeList(pageDTO);
			model.addAttribute("popList", popList);
			count=employeeService.getEmployeeCount();
		}else {
			List<ProductDTO> popList=productService.getProductList(pageDTO);
			model.addAttribute("popList", popList);
			count=productService.getProductCount(pageDTO);
		}
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage>pageCount) endPage=pageCount;
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("pop", pop);
		model.addAttribute("pageDTO", pageDTO);
		return "search/searchPop";
	}
}
