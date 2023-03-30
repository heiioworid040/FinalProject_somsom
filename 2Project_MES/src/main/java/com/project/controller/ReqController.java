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
import com.project.domain.ReqDTO;
import com.project.service.ClientService;
import com.project.service.EmployeeService;
import com.project.service.ProductService;
import com.project.service.ReqService;


//컨트롤러 역할
@Controller
public class ReqController {

	//맴버변수 부모 인터페이스 정의 -> 자동으로 자식 클래스 객체 생성
	//스프링 객체생성 방식 => 의존관계주입(DI : Depend Injection)
	@Inject // 자동으로 자식 매서드를 찾겠다
	private ReqService reqService;
	
	@Inject // 자동으로 자식 매서드를 찾겠다
	private ProductService productService;
	
	@Inject
	private ClientService clientService;
	
	@Inject
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/req/reqlist", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {
		//조건 : writeForm의 id값이랑 DTO 값이랑 같아야 값을 받아온다
		System.out.println("req list");
		
		//검색어
		String search = request.getParameter("search");
		
		// 환 화면에 보여줄 글 개수 설정
		int pageSize=10; // 10개씩 자르겠다.
		
		// 현재 페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			//pageNum 없는경우  1페이지 설정
			pageNum ="1";
			
		}
		//페이지 번호를 정수 형으로 변경
		int currentPage = Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		//검색어 담기
		pageDTO.setSearch(search);
		
		List<ReqDTO> reqList = reqService.getReqList(pageDTO);
		
		//페이징
		int count = reqService.getReqCount(pageDTO);
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		model.addAttribute("reqList",reqList);
		model.addAttribute(pageDTO);
		//주소변경 하면서 이동
		return "req/reqlist";
	}
	// 추가
	@RequestMapping(value = "/req/reqinsert", method = RequestMethod.GET)
	public String insert() {
		
		System.out.println("insert()");
		return "req/reqinsert";
	}
	// 생성 주소 변환 
	@RequestMapping(value = "/req/reqinsertPro", method = RequestMethod.POST)
	public String insertPro(ReqDTO reqDTO) {
		System.out.println("reqDTO insertPro()");

		reqService.insertReq(reqDTO);

//		주소줄 변경하면서 이동
		return "redirect:/req/reqlist";
	}
	
	
	@RequestMapping(value = "/req/orderPop", method = RequestMethod.GET)
	public String orderPop(HttpServletRequest request, Model model) {
		int pageSize=10;
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.valueOf(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		String pop=(String)request.getParameter("pop");

		int count=0;
		if(pop.equals("cli")) {
			List<ClientDTO> popList=clientService.getClientInfo(pageDTO);
			model.addAttribute("popList", popList);
			count=clientService.getClientCount(pageDTO);
		}else if(pop.equals("emp")) {
			List<EmployeeDTO> popList=employeeService.getEmployeeList(pageDTO);
			model.addAttribute("popList", popList);
			count=employeeService.getEmployeeCount(pageDTO);
		}else {
			List<ProductDTO> popList=productService.getProductList(pageDTO);
			model.addAttribute("popList", popList);
			count=productService.getProductCount(pageDTO);
		}
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("pop", pop);
		model.addAttribute("pageDTO", pageDTO);
		return "req/orderPop";
	}
	

	//수정
	@RequestMapping(value = "/req/requpdate", method = RequestMethod.GET)
	public String update(HttpServletRequest request,Model model) {
		// 주소변경 없이 이동
		int req_num= Integer.parseInt(request.getParameter("req_num"));
		
		ReqDTO reqDTO = reqService.getReq(req_num);
		//request 대신에 스프링 제공 Model 담아서 이동
		model.addAttribute("reqDTO",reqDTO);

		System.out.println("requpdate"+req_num);
		System.out.println("reqDTO : "+reqDTO);
		return "req/requpdate";
		
		
		
	}
	
	@RequestMapping(value = "/req/requpdatePro", method = RequestMethod.POST)
	public String updatePro(ReqDTO reqDTO) {
	
		reqService.updateReq(reqDTO);
		
		//request 대신에 스프링 제공 Model 담아서 이동
		
		
		return "redirect:/req/reqlist";
	}
	
	//삭제
	@RequestMapping(value = "/req/reqdeletePro", method = RequestMethod.GET)
	public String delete(HttpServletRequest request) {
		// 주소변경 없이 이동
		// /WEB-INF/views/member/deleteForm.jsp
		int req_num= Integer.parseInt(request.getParameter("req_num"));
		reqService.deleteReq(req_num);
		
		return "redirect:/req/reqlist";
	}
	
	
	
	
	
}
