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
import com.project.service.ClientService;

@Controller
public class ClientController {

	@Inject
	private ClientService clientService;

	@RequestMapping(value = "/client/clientInfo", method = RequestMethod.GET)
	public String info(HttpServletRequest request, Model model) {
		System.out.println("ClientController info()");
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

		List<ClientDTO> clientInfo = clientService.getClientInfo(pageDTO);

		// 페이징 처리
		int count = clientService.getClientCount();
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

		model.addAttribute("clientInfo", clientInfo);
		model.addAttribute("pageDTO", pageDTO);
		// 주소변경 없이 이동
		return "client/clientInfo";
	}

	@RequestMapping(value = "/client/delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request) {
		System.out.println("ClientController delete()");

		String[] cli_cd = request.getParameterValues("chk");
		for (int i = 0; i < cli_cd.length; i++) {
			clientService.deleteClient(cli_cd[i]);
		}

		// 주소변경 하면서 이동
		return "redirect:/client/clientInfo";
	}

}
