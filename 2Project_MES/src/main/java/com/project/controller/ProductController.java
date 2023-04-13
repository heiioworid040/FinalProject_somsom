package com.project.controller;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.ClientDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;
import com.project.service.ClientService;
import com.project.service.PerformanceService;
import com.project.service.ProductService;




//컨트롤러 역할
@Controller
public class ProductController {

	//맴버변수 부모 인터페이스 정의 -> 자동으로 자식 클래스 객체 생성
	//스프링 객체생성 방식 => 의존관계주입(DI : Depend Injection)
	@Inject // 자동으로 자식 매서드를 찾겠다
	private ProductService productService;

	@Inject
	private ClientService clientService;
	
	@Inject
	private PerformanceService performanceService;

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

		List<ProductDTO> productList = productService.getProductList(pageDTO);

		//페이징
		int count = productService.getProductCount(pageDTO);

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
		System.out.println("카운트 : "+count);
		System.out.println("페이지카운트 : "+pageCount);

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
	@RequestMapping(value = "/product/productupdate", method = RequestMethod.GET)
	public String update(HttpServletRequest request,Model model) {
		// 주소변경 없이 이동
		int prod_number= Integer.parseInt(request.getParameter("prod_number"));

		ProductDTO productDTO = productService.getProduct(prod_number);
		//request 대신에 스프링 제공 Model 담아서 이동
		model.addAttribute("productDTO",productDTO);

		System.out.println(productDTO.getProd_cd());
		return "product/productupdate";

	}

	@RequestMapping(value = "/product/productupdatePro", method = RequestMethod.POST)
	public String updatePro(ProductDTO productDTO) {
		System.out.println("productDTO.getProd_outprice : "+productDTO.getProd_outprice());
		System.out.println("productDTO.getProd_mat : "+productDTO.getProd_mat());
		System.out.println("productDTO.getProd_number : "+productDTO.getProd_number());
		productService.updateProduct(productDTO);

		//request 대신에 스프링 제공 Model 담아서 이동


		return "redirect:/product/productlist";
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

	//거래처 검색



	@RequestMapping(value = "/product/productorderPop", method = RequestMethod.GET)
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
		String pop=request.getParameter("pop");

		int count=0;
		if(pop.equals("cli")) {
			List<ClientDTO> popList=clientService.getClientInfo(pageDTO);
			model.addAttribute("popList", popList);
			count=clientService.getClientCount(pageDTO);
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
		return "product/productorderPop";
	}
	
	// 품목 검색 팝업창
	@RequestMapping(value = "/product/productSearchPop2", method = RequestMethod.GET)
	public String productSearchPop(HttpServletRequest request, Model model) {
		System.out.println("productSearchPop2()");
		// 검색어 가져오기
		String search = request.getParameter("search");
		String search2 = request.getParameter("search2");
		String search3 = request.getParameter("search3");
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 10;
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			// pageNum 없으면 1페이지 설정
			pageNum = "1";
		}
		// 페이지번호를 => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);

		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		// 검색어
		pageDTO.setSearch(search);
		pageDTO.setSearch2(search2);
		pageDTO.setSearch3(search3);


		List<ProductDTO> productInfo = performanceService.getProductInfo(pageDTO);

		// 페이징 처리
		// 검색어
		int count = performanceService.getProductCount(pageDTO);
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		model.addAttribute("productInfo", productInfo);
		model.addAttribute("pageDTO", pageDTO);
		// 주소변경 없이 이동
		return "product/productSearchPop2";
	}
	
	// 품목 검색 팝업창2
	@RequestMapping(value = "/product/productSearchPop3", method = RequestMethod.GET)
	public String productSearchPop3(HttpServletRequest request, Model model) {
		System.out.println("productSearchPop3()");
		// 검색어 가져오기
		String search = request.getParameter("search");
		String search2 = request.getParameter("search2");
		String search3 = request.getParameter("search3");
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 10;
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			// pageNum 없으면 1페이지 설정
			pageNum = "1";
		}
		// 페이지번호를 => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);

		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		// 검색어
		pageDTO.setSearch(search);
		pageDTO.setSearch2(search2);
		pageDTO.setSearch3(search3);


		List<ProductDTO> productInfo = performanceService.getProductInfo(pageDTO);

		// 페이징 처리
		// 검색어
		int count = performanceService.getProductCount(pageDTO);
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		model.addAttribute("productInfo", productInfo);
		model.addAttribute("pageDTO", pageDTO);
		// 주소변경 없이 이동
		return "product/productSearchPop3";
	}



}
