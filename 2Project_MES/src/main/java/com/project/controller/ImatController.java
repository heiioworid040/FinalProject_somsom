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
import com.project.domain.ProductDTO;
import com.project.service.ImatService;

@Controller
public class ImatController {
	@Inject
	private ImatService ImatService;


	@RequestMapping(value = "/imat/imatinsert", method = RequestMethod.GET)
	public String imatinsert() {
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/center/write.jsp
		return "imat/imatinsert";
	}


	// 가상주소 http://localhost:8080/SFunWeb/board/writePro
	@RequestMapping(value = "/imat/imatinsertPro", method = RequestMethod.POST)
	public String imatinsertPro(ImatDTO imatDTO) {
		System.out.println("ImatController insertPro()");
		// 글쓰기 처리 BoardService, BoardServiceImpl, insertBoard()
		// BoardDAO, BoardDAOImpl, insertBoard()
//			boardService.insertBoard(boardDTO);
		ImatService.insertImat(imatDTO);
//			주소줄 변경하면서 이동
		return "redirect:/imat/imatbeList";
	}

	@RequestMapping(value = "/imat/imatupdate", method = RequestMethod.GET)
	public String imatupdate(HttpServletRequest request, Model model) {

		String imat_cd = request.getParameter("imat_cd");

		ImatDTO imatDTO = ImatService.getImat(imat_cd);
		System.out.println(imatDTO);
		System.out.println("ImatController getImat()");
		model.addAttribute("imatDTO", imatDTO);
		System.out.println("ImatController imatupdate()");
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/center/update.jsp
		return "imat/imatupdate";
	}

	// 가상주소 http://localhost:8080/SFunWeb/board/updatePro
	@RequestMapping(value = "/imat/imatupdatePro", method = RequestMethod.POST)
	public String imatupdatePro(ImatDTO imatDTO) {
		System.out.println("ImatController imatupdatePro()");

		ImatService.updateImat(imatDTO);

//		주소줄 변경하면서 이동
		return "redirect:/imat/imatbeList";
	}

	
	@RequestMapping(value = "/imat/imatpopPro", method = RequestMethod.GET)
	public String imatpopPro(HttpServletRequest request, Model model) {
		System.out.println("ImatController imatpopPro()");
		String prod_cd = request.getParameter("prod_cd");
		ProductDTO product = ImatService.getProd(prod_cd);
		model.addAttribute("prod_cd",product.getProd_cd());
		model.addAttribute("prod_mat",product.getProd_mat());
//		주소줄 변경하면서 이동 
		return "imat/imatinsert";
	}
	
	@RequestMapping(value = "imat/imatbeList", method = RequestMethod.GET)
	public String ImatbeList(HttpServletRequest request, Model model) {
		System.out.println("ImatController ImatbeList()");

		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println("ImatController ImatbeList()-1");
		int currentPage = Integer.parseInt(pageNum);

		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		System.out.println("ImatController ImatbeList()-2");
		List<ImatDTO> imatbeList = ImatService.getImatbeList(pageDTO);
		System.out.println("ImatController ImatbeList()-2-1");
		int count = ImatService.getImatCount(pageDTO);
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
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

		System.out.println("ImatController ImatbeList() Imat_num:" + imatbeList.get(0).getImat_num());
		System.out.println("ImatController ImatbeList() Imat_cd" + imatbeList.get(0).getImat_cd());
		System.out.println("ImatController ImatbeList() Imat_date" + imatbeList.get(0).getImat_date());
		return "imat/imatbeList";
	}


	@RequestMapping(value = "iomat/iomatList", method = RequestMethod.GET)
	public String IomatList(HttpServletRequest request, Model model) {
		System.out.println("ImatController IomatList()");
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println("ImatController iomatList()-1");
		int currentPage = Integer.parseInt(pageNum);

		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		System.out.println("ImatController iomatList()-2");
		List<ImatDTO> iomatList = ImatService.getIomatList(pageDTO);
		System.out.println("ImatController iomatList()-2-1");
		int count = ImatService.getImatCount(pageDTO);
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("ImatController iomatList()-3");
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		model.addAttribute("IomatList",iomatList);
		model.addAttribute("pageDTO", pageDTO);

		return "iomat/iomatList";
	}


	@RequestMapping(value = "/imat/imatpop", method = { RequestMethod.POST, RequestMethod.GET })
	public List<ProductDTO> ImatprodList(HttpServletRequest request, Model model) throws Exception {
		System.out.println("ImatController ImatprodList");
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
		List<ProductDTO> imatprodList = ImatService.getImatprodList(pageDTO);
		int count = ImatService.getImatCount(pageDTO);
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
		model.addAttribute("ImatprodList", imatprodList);
		model.addAttribute("pageDTO", pageDTO);
		return imatprodList;
	}

	@RequestMapping(value = "/imat/imatdelete", method = RequestMethod.GET)
	public String deleteList(HttpServletRequest request, Model model) {
		System.out.println("ImatController imatdelete()");
		String imat_cd = request.getParameter("imat_cd");
		ImatService.deleteList(imat_cd);

//		주소줄 변경하면서 이동
		return "redirect:/imat/imatbeList";
	}

	@RequestMapping(value = "/imat/imatpopsear", method = RequestMethod.GET)
	public String imatpopsear(HttpServletRequest request, Model model) {
		System.out.println("ImatController imatpopsear()");
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
		List<ProductDTO> imatprodList = ImatService.getImatprodList(pageDTO);
		
		//페이징 처리
		//검색어
		int count = ImatService.getImatCount(pageDTO);
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
		
		
		model.addAttribute("ImatprodList", imatprodList);
		model.addAttribute("pageDTO", pageDTO);
		
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/fcenter/fnotice.jsp
		return "imat/imatpop";
	}
	
	@RequestMapping(value = "/imat/imatsearch", method = RequestMethod.GET)
	public String imatsearch(HttpServletRequest request, Model model) {
		System.out.println("ImatController imatsearch()");
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
		
		List<ImatDTO> imatbeList=ImatService.getImatbeList(pageDTO);
		
		//페이징 처리
		//검색어
		int count = ImatService.getImatCount(pageDTO);
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
		
		
		model.addAttribute("ImatbeList", imatbeList);
		model.addAttribute("pageDTO", pageDTO);
		
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/fcenter/fnotice.jsp
		return "imat/imatbeList";
	}
	
}
