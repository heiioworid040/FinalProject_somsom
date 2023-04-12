package com.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.OmatDTO;
import com.project.domain.OmatDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;
import com.project.service.OmatService;

@Controller
public class OmatController {
	@Inject
	private OmatService OmatService;

//	@Inject
//	private OmatService omatService;
//	@RequestMapping(value = "/omat/omatbeListPro", method = RequestMethod.POST)
//	public String getInfoOmatPro(OmatDTO omatDTO) {
//		System.out.println("OmatController getomatbeListPro()");
//		OmatService.getOmat(omatDTO);
//		return "redirect:/omat/omatbeList";
//	}

	@RequestMapping(value = "/omat/omatinsert", method = RequestMethod.GET)
	public String omatinsert() {
		System.out.println("OmatController omatinsert()");
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/center/write.jsp
		return "omat/omatinsert";
	}


	@RequestMapping(value = "/omat/omatupdate", method = RequestMethod.GET)
	public String omatupdate(HttpServletRequest request, Model model) {

		String omat_cd = request.getParameter("omat_cd");

		OmatDTO omatDTO = OmatService.getOmat(omat_cd);
		System.out.println(omatDTO);
		System.out.println("OmatController getOmat()");
		model.addAttribute("omatDTO", omatDTO);
		System.out.println("OmatController omatupdate()");
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/center/update.jsp
		return "omat/omatupdate";
	}

	// 가상주소 http://localhost:8080/SFunWeb/board/updatePro
	@RequestMapping(value = "/omat/omatupdatePro", method = RequestMethod.POST)
	public String omatupdatePro(OmatDTO omatDTO) {
		System.out.println("OmatController omatupdatePro()");

		OmatService.updateOmat(omatDTO);

//		주소줄 변경하면서 이동
		return "redirect:/omat/omatbeList";
//		return "redirect:/omat/omatbeList";
	}
	
	@RequestMapping(value = "/omat/omatpopPro", method = RequestMethod.GET)
	public String omatpopPro(HttpServletRequest request, Model model) {
		System.out.println("OmatController omatpopPro()");
		String prod_cd = request.getParameter("prod_cd");
		ProductDTO product = OmatService.getProd(prod_cd);
		model.addAttribute("prod_cd",product.getProd_cd());
		model.addAttribute("prod_mat",product.getProd_mat());
		
//		주소줄 변경하면서 이동 
		return "omat/omatinsert";
	}

	@RequestMapping(value = "/omat/omatinsertPro", method = RequestMethod.POST)
	public String omatinsertPro(OmatDTO omatDTO) {
		System.out.println("OmatController insertPro()");
		// 글쓰기 처리 BoardService, BoardServiceImpl, insertBoard()
		// BoardDAO, BoardDAOImpl, insertBoard()
//			boardService.insertBoard(boardDTO);
		OmatService.insertOmat(omatDTO);
//			주소줄 변경하면서 이동
		return "redirect:/omat/omatbeList";
	}


	@RequestMapping(value = "omat/omatbeList", method = RequestMethod.GET)
	public String OmatbeList(HttpServletRequest request, Model model) {
		System.out.println("OmatController OmatbeList()");

		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println("OmatController OmatbeList()-1");
		int currentPage = Integer.parseInt(pageNum);

		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		System.out.println("OmatController OmatbeList()-2");
		List<OmatDTO> omatbeList = OmatService.getOmatbeList(pageDTO);
		System.out.println("OmatController OmatbeList()-2-1");
		int count = OmatService.getOmatCount(pageDTO);
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("OmatController OmatbeList()-3");
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		model.addAttribute("OmatbeList", omatbeList);
		model.addAttribute("pageDTO", pageDTO);
		System.out.println("OmatController OmatbeList()-4");
		System.out.println("OmatController OmatbeList()-4" + omatbeList.get(0).getOmat_cd());
		System.out.println("OmatController OmatbeList()-4" + omatbeList.get(0).getOmat_date());
		System.out.println("OmatController OmatbeList()-4" + omatbeList.get(0).getOmat_num());
		return "omat/omatbeList";
	}

//	@RequestMapping(value = "omat/omatprodList1", method = RequestMethod.GET)
//	public String OmatprodList1(HttpServletRequest request, Model model) {
//		System.out.println("OmatController OmatprodList1()");
//
//		int pageSize = 10;
//		String pageNum = request.getParameter("pageNum");
//		if (pageNum == null) {
//			pageNum = "1";
//		}
//		System.out.println("OmatController OmatprodList1()-1");
//		int currentPage = Integer.parseInt(pageNum);
//
//		PageDTO pageDTO = new PageDTO();
//		pageDTO.setPageSize(pageSize);
//		pageDTO.setPageNum(pageNum);
//		pageDTO.setCurrentPage(currentPage);
//		System.out.println("OmatController OmatprodList1()-2");
//		List<ProductDTO> omatprodList1 = OmatService.getOmatprodList1(pageDTO);
//
//		int count = OmatService.getOmatCount();
//		int pageBlock = 10;
//		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
//		int endPage = startPage + pageBlock - 1;
//		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
//		if (endPage > pageCount) {
//			endPage = pageCount;
//		}
//		System.out.println("OmatController OmatbeList()-3");
//		pageDTO.setCount(count);
//		pageDTO.setPageBlock(pageBlock);
//		pageDTO.setStartPage(startPage);
//		pageDTO.setEndPage(endPage);
//		pageDTO.setPageCount(pageCount);
//
//		model.addAttribute("OmatprodList1", omatprodList1);
//		model.addAttribute("pageDTO", pageDTO);
//		return "omat/omatinsert";
//	}

	
	@RequestMapping(value = "/omat/omatpop", method = { RequestMethod.POST, RequestMethod.GET })
	public List<ProductDTO> OmatprodList(HttpServletRequest request, Model model) throws Exception {
		System.out.println("OmatController OmatprodList");
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);

		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		List<ProductDTO> omatprodList = OmatService.getOmatprodList(pageDTO);
		int count = OmatService.getOmatCount(pageDTO);
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
		model.addAttribute("OmatprodList", omatprodList);
		model.addAttribute("pageDTO", pageDTO);
		return omatprodList;
	}

	@RequestMapping(value = "/omat/omatdelete", method = RequestMethod.GET)
	public String deleteList(HttpServletRequest request, Model model) {
		System.out.println("OmatController omatdelete()");
		String omat_cd = request.getParameter("omat_cd");
		OmatService.deleteList(omat_cd);

//		주소줄 변경하면서 이동
		return "redirect:/omat/omatbeList";
	}
	
	@RequestMapping(value = "/omat/omatsearch", method = RequestMethod.GET)
	public String omatsearch(HttpServletRequest request, Model model) {
		System.out.println("OmatController omatsearch()");
		//검색어 가져오기
		String search=request.getParameter("search");
		String search2=request.getParameter("search2");
		String search3=request.getParameter("search3");
		
		// 한 화면에 보여줄 글 개수 설정
		int pageSize=15;
		// 현페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			//pageNum 없으면 1페이지 설정
			pageNum="1";
		}
		// 페이지번호를 => 정수형 변경
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		//검색어
		pageDTO.setSearch(search);
		pageDTO.setSearch2(search2);
		pageDTO.setSearch3(search3);
		
		List<OmatDTO> omatbeList=OmatService.getOmatbeList(pageDTO);
		
		//페이징 처리
		//검색어
		int count = OmatService.getOmatCount(pageDTO);
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
		
		
		model.addAttribute("OmatbeList", omatbeList);
		model.addAttribute("pageDTO", pageDTO);
		
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/fcenter/fnotice.jsp
		return "omat/omatbeList";
	}

	@RequestMapping(value = "/omat/omatpopsear", method = RequestMethod.GET)
	public String omatpopsear(HttpServletRequest request, Model model) {
		System.out.println("OmatController omatpopsear()");
		//검색어 가져오기
		String search=request.getParameter("search");
		String search2=request.getParameter("search2");
		String search3=request.getParameter("search3");
		
		// 한 화면에 보여줄 글 개수 설정
		int pageSize=15;
		// 현페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			//pageNum 없으면 1페이지 설정
			pageNum="1";
		}
		// 페이지번호를 => 정수형 변경
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		//검색어
		pageDTO.setSearch(search);
		pageDTO.setSearch2(search2);
		pageDTO.setSearch3(search3);
		List<ProductDTO> omatprodList = OmatService.getOmatprodList(pageDTO);
		
		//페이징 처리
		//검색어
		int count = OmatService.getOmatCount(pageDTO);
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
		
		
		model.addAttribute("OmatprodList", omatprodList);
		model.addAttribute("pageDTO", pageDTO);
		
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/fcenter/fnotice.jsp
		return "omat/omatpop";
	}
}
