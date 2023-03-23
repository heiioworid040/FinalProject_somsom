package com.project.controller;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;
import com.project.service.ProductService;



//컨트롤러 역할
@Controller
public class ProductController {

	//맴버변수 부모 인터페이스 정의 -> 자동으로 자식 클래스 객체 생성
	//스프링 객체생성 방식 => 의존관계주입(DI : Depend Injection)
	@Inject // 자동으로 자식 매서드를 찾겠다
	private ProductService productService;
	
	@RequestMapping(value = "/product/productwrite", method = RequestMethod.GET)
	public String write() {
		System.out.println("product Write");
		return "product/productwirte";
	}
	
	@RequestMapping(value = "/product/productwritePro", method = RequestMethod.POST)
	public String writePro(ProductDTO productDTO) {
		//조건 : writeForm의 id값이랑 DTO 값이랑 같아야 값을 받아온다
		System.out.println("product WritePro");
		
		//글쓰기 작업 메서드 호출
		productService.insertProduct(productDTO);
		
		//주소변경 하면서 이동
		return "redirect:/product/productlist";
	}
	
	@RequestMapping(value = "/product/productlist", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {
		//조건 : writeForm의 id값이랑 DTO 값이랑 같아야 값을 받아온다
		System.out.println("product list");
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
		
		List<ProductDTO> productList = productService.getProductList(pageDTO);
		
		//페이징
		int count = productService.getProductCount();
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

		model.addAttribute("productList",productList);
		model.addAttribute(pageDTO);
		//주소변경 하면서 이동
		return "product/productlist";
	}
	
	//상세글조회
	@RequestMapping(value = "/product/productcontext", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {
		int prod_number= Integer.parseInt(request.getParameter("prod_number"));
		
		ProductDTO productDTO = productService.getProduct(prod_number);
		model.addAttribute("productDTO",productDTO);
		
		return "product/productcontext";
	}
	
	
	//수정
	@RequestMapping(value = "/product/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request,Model model) {
		// 주소변경 없이 이동
		int prod_number= Integer.parseInt(request.getParameter("prod_number"));
		
		ProductDTO productDTO = productService.getProduct(prod_number);
		//request 대신에 스프링 제공 Model 담아서 이동
		model.addAttribute("productDTO",productDTO);
		
		return "product/updateForm";
	}
	
	@RequestMapping(value = "/product/updatePro", method = RequestMethod.POST)
	public String updatePro(ProductDTO productDTO) {
		// 주소변경 없이 이동
		
		productService.updateProduct(productDTO);
		
		//request 대신에 스프링 제공 Model 담아서 이동
		
		
		return "redirect:/product/list";
	}
	
	//삭제
	@RequestMapping(value = "/product/productdeletePro", method = RequestMethod.GET)
	public String delete(HttpServletRequest request) {
		// 주소변경 없이 이동
		// /WEB-INF/views/member/deleteForm.jsp
		int prod_number= Integer.parseInt(request.getParameter("prod_number"));
		productService.deleteProduct(prod_number);
		
		return "redirect:/product/productlist";
	}
	
	
	
}
