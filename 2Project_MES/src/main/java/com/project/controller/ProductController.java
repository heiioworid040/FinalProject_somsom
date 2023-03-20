package com.project.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

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
	public String info() {

		
		
		return "product/productForm";
	}
	
	
}
