package com.project.controller;



import java.util.List;

import javax.inject.Inject;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.ProductDTO;
import com.project.service.ProductService;



//컨트롤러 역할
@Controller
public class ProductController {

	//맴버변수 부모 인터페이스 정의 -> 자동으로 자식 클래스 객체 생성
	//스프링 객체생성 방식 => 의존관계주입(DI : Depend Injection)
	@Inject // 자동으로 자식 매서드를 찾겠다
	private ProductService productService;
	
	@RequestMapping(value = "/product/productForm", method = RequestMethod.GET)
	public String list(Model model) {
		
		List<ProductDTO> productList = productService.getProductList();
		model.addAttribute("productList",productList);
		return "product/productForm";
	}

	@RequestMapping(value = "/product/insertPro", method = RequestMethod.POST)
	public String insertPro(ProductDTO productDTO) {
		// HttpServletRequest request
		// 사용자가 입력한 내용 => request에 저장 => request 가져오기
		// post방식 한글 깨지고 request.setCharacterEncoding("UTF-8")
		// web.xml에서 한글설정을 한번만하고 모든 곳에서 한글처리가 됨
		System.out.println("ProductController insertPro()");
		
		// 메서드 호출
		productService.insertProduct(productDTO);
		
		
		return "redirect:/product/productForm";
	}
	
}
