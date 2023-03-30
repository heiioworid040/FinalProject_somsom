package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.ClientDAO;
import com.project.domain.ClientDTO;
import com.project.domain.PageDTO;

@Service
public class ClientServiceImpl implements ClientService {

	@Inject
	private ClientDAO clientDAO;

	@Override
	public List<ClientDTO> getClientInfo(PageDTO pageDTO) {
		System.out.println("ClientServiceImpl getClientInfo()");
		// 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;

		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);

		return clientDAO.getClientInfo(pageDTO);
	}
	
	// 검색어
	@Override
	public int getClientCount(PageDTO pageDTO) {
		System.out.println("ClientServiceImpl getClientCount()");

		return clientDAO.getClientCount(pageDTO);
	}

	@Override
	public void deleteClient(String cli_cd) {
		System.out.println("ClientServiceImpl deleteClient()");

		clientDAO.deleteClient(cli_cd);
	}

	@Override
	public void insertClient(ClientDTO clientDTO) {
		System.out.println("ClientServiceImpl insertMember()");

		clientDAO.insertClient(clientDTO);

	}

	@Override
	public ClientDTO getClient(String cli_cd) {
		System.out.println("ClientServiceImpl getClient()");

		return clientDAO.getClient(cli_cd);
	}

	@Override
	public void updateClient(ClientDTO clientDTO) {
		System.out.println("ClientServiceImpl updateClient()");

		clientDAO.updateClient(clientDTO);
	}

	@Override
	public int clientDupCheck(String cli_num) {
		System.out.println("ClientServiceImpl clientDupCheck()");

		int count = clientDAO.clientDupCheck(cli_num);
		return count;
	}

}
