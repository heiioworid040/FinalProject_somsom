package com.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.PageDTO;
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
	
	@RequestMapping(value = "/employee/employeeList", method = RequestMethod.GET)
	public String employeeList(HttpServletRequest request, Model model) {
		System.out.println("EmployeeController employee_List()");
		
		int pageSize=10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<EmployeeDTO> employeeList = employeeService.getEmployeeList(pageDTO);
		
		int count = employeeService.getEmployeeCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "employee/employeeList";
	}
	
	@RequestMapping(value = "/employee/insertEmployee", method = RequestMethod.GET)
	public String insertEmployee(HttpServletRequest request, Model model) {
		System.out.println("EmployeeController insertEmployee()");
		
		int pageSize=10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<EmployeeDTO> employeeList = employeeService.getEmployeeList(pageDTO);
		
		int count = employeeService.getEmployeeCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "employee/insertEmployee";
	}
	

	@RequestMapping(value = "/employee/insertPro", method = RequestMethod.POST)
	public String insertPro(EmployeeDTO employeeDTO) {

		employeeService.insertEmployee(employeeDTO);
		
//		주소줄 변경하면서 이동
		return "redirect:/employee/employeeList";
	}
	
	@RequestMapping(value = "/employee/deletePro", method = RequestMethod.GET)
	public String deletetPro(HttpServletRequest request) {
		System.out.println("EmployeeController deletePro");
		String[] emp_cd = request.getParameterValues("ck");
		System.out.println("emp_cd="+emp_cd);
			for(int i=0;i<emp_cd.length;i++) {		
			System.out.println(emp_cd);
			employeeService.deleteEmployee(emp_cd[i]);
			
			}
//		주소줄 변경하면서 이동
		return "redirect:/employee/employeeList";
	}

	
	@RequestMapping(value = "/employee/updateList", method = RequestMethod.GET)
	public String updateList(Model model) {

		List<EmployeeDTO> updateList=employeeService.getUpdateList();
		model.addAttribute("updateList",updateList);
		
		return "employee/updateEmployee";
	}
	
	@RequestMapping(value = "/employee/updatePro", method = RequestMethod.POST)
	public String updatePro(HttpServletRequest request) {
		System.out.println("EmployeeController updatePro");
		
		String[] emp_cd = request.getParameterValues("ck");
		System.out.println("emp_cd="+emp_cd);
			
		for(int i=0;i<emp_cd.length;i++) {		
			System.out.println(emp_cd);
			employeeService.updateEmployee(emp_cd[i]);			
			}
		
//		주소줄 변경하면서 이동
		return "redirect:/employee/employeeList";
	}
	
	
	
	
	
	
	
}
