package com.project.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.PageDTO;
import com.project.domain.ShipDTO;
import com.project.service.ShipService;

@Controller
public class ShipController {

	@Inject
	private ShipService shipService;

	@RequestMapping(value = "/ship/shipCurrentInfo", method = RequestMethod.GET)
	public String currentInfo(HttpServletRequest request, Model model) {
		System.out.println("ShipController currentInfo()");
		// 검색어 가져오기
		String search = request.getParameter("search");
		String search2 = request.getParameter("search2");
		String search3 = request.getParameter("search3");
		String search4 = request.getParameter("search4");
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 20;
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
		pageDTO.setSearch4(search4);

		List<ShipDTO> shipCurrentInfo = shipService.shipCurrentInfo(pageDTO);

		// 페이징 처리
		// 검색어
		int count = shipService.shipCurrentCount(pageDTO);
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

		model.addAttribute("shipCurrentInfo", shipCurrentInfo);
		model.addAttribute("pageDTO", pageDTO);
		// 주소변경 없이 이동
		return "ship/shipCurrentInfo";
	}
	
	@RequestMapping(value = "/ship/currDelete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request) {
		
		try {
			String[] ship_cd = request.getParameterValues("chk");
			for (int i = 0; i < ship_cd.length; i++) {
				shipService.currDelete(ship_cd[i]);
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		}

		// 주소변경 하면서 이동
		return "redirect:/ship/shipCurrentInfo";
	}
	
	@RequestMapping(value = "/ship/shipInfo", method = RequestMethod.GET)
	public String info(HttpServletRequest request, Model model) {
		PageDTO pageDTO=new PageDTO();
		pageDTO.setSearch(request.getParameter("cli"));
		pageDTO.setSearch2(request.getParameter("prod"));
		pageDTO.setSearch3(request.getParameter("ord_date"));
		pageDTO.setSearch4(request.getParameter("ord_date_end"));
		pageDTO.setSearch5(request.getParameter("ord_d_date"));
		pageDTO.setSearch6(request.getParameter("ord_d_date_end"));
		
		List<ShipDTO> shipInfo=shipService.shipInfo(pageDTO);
		
		model.addAttribute("shipInfo", shipInfo);
		return "ship/shipInfo";
	}
	
	@RequestMapping(value = "/ship/shipInfoPro", method = RequestMethod.POST)
	public String insertPro(HttpServletRequest request, Model model) {
		String ord_cd[]=request.getParameterValues("ord_cd");
		String ship_ifcount[]=request.getParameterValues("ship_ifcount");
		String ship_count[]=request.getParameterValues("ship_count");
//		int ship_over=999;
//		int ship_inven=111;
		String ship_date[]=request.getParameterValues("ship_date");

		for(int i=0;i<ord_cd.length;i++) {
			if(ship_count[i]!="") {
				ShipDTO shipDTO=new ShipDTO();
				shipDTO.setOrd_cd(ord_cd[i]);
				shipDTO.setShip_ifcount(Integer.parseInt(ship_ifcount[i]));
				shipDTO.setShip_count(Integer.parseInt(ship_count[i]));
				shipDTO.setShip_over(999);
				shipDTO.setShip_inven(111);
				shipDTO.setShip_date(Timestamp.valueOf(ship_date[i]+" 23:59:59"));
				shipService.shipInfoPro(shipDTO);
//				System.out.println(shipDTO.getOrd_cd()+" "+shipDTO.getShip_ifcount()+" "+shipDTO.getShip_count()+" "+shipDTO.getShip_date());
			}
		}
		
		return "redirect:/ship/shipInfo";
	}
}
