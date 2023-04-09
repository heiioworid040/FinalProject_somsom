package com.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.aop.target.dynamic.AbstractRefreshableTargetSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ser.AnyGetterWriter;
import com.project.domain.ImatDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;
import com.project.service.ImatService;

@Controller
public class ImatController {
	@Inject
	private ImatService ImatService;

//	@Inject
//	private ImatService imatService;
//	@RequestMapping(value = "/imat/imatbeListPro", method = RequestMethod.POST)
//	public String getInfoImatPro(ImatDTO imatDTO) {
//		System.out.println("ImatController getimatbeListPro()");
//		ImatService.getImat(imatDTO);
//		return "redirect:/imat/imatbeList";
//	}

	@RequestMapping(value = "/imat/imatinsert", method = RequestMethod.GET)
	public String imatinsert() {
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/center/write.jsp
		return "imat/imatinsert";
	}
//
//	@RequestMapping(value = "/imat/imatpop", method = RequestMethod.GET)
//	public String imatpop() {
////		주소줄 변경없이 이동
////		/WEB-INF/views/파일이름.jsp
////		/WEB-INF/views/center/write.jsp
//		return "imat/imatpop";
//	}
//

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
		int count = ImatService.getImatCount();
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

//		String formattedTimestamp = "";
//		try {
//		    Timestamp timestamp = imatbeList.get(0).getImat_date();
//		    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		    formattedTimestamp = formatter.format(timestamp.toLocalDateTime());
//		} catch (Exception e) {
//		    e.printStackTrace();
//		}

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
		int count = ImatService.getImatCount();
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

//	@RequestMapping(value = "imat/imatprodList1", method = RequestMethod.GET)
//	public String ImatprodList1(HttpServletRequest request, Model model) {
//		System.out.println("ImatController ImatprodList1()");
//
//		int pageSize = 10;
//		String pageNum = request.getParameter("pageNum");
//		if (pageNum == null) {
//			pageNum = "1";
//		}
//		System.out.println("ImatController ImatprodList1()-1");
//		int currentPage = Integer.parseInt(pageNum);
//
//		PageDTO pageDTO = new PageDTO();
//		pageDTO.setPageSize(pageSize);
//		pageDTO.setPageNum(pageNum);
//		pageDTO.setCurrentPage(currentPage);
//		System.out.println("ImatController ImatprodList1()-2");
//		List<ProductDTO> imatprodList1 = ImatService.getImatprodList1(pageDTO);
//
//		int count = ImatService.getImatCount();
//		int pageBlock = 10;
//		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
//		int endPage = startPage + pageBlock - 1;
//		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
//		if (endPage > pageCount) {
//			endPage = pageCount;
//		}
//		System.out.println("ImatController ImatbeList()-3");
//		pageDTO.setCount(count);
//		pageDTO.setPageBlock(pageBlock);
//		pageDTO.setStartPage(startPage);
//		pageDTO.setEndPage(endPage);
//		pageDTO.setPageCount(pageCount);
//
//		model.addAttribute("ImatprodList1", imatprodList1);
//		model.addAttribute("pageDTO", pageDTO);
//		return "imat/imatinsert";
//	}

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
		int count = ImatService.getImatCount();
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

}
