package com.project.dao;

import java.util.List;

import com.project.domain.ClientDTO;
import com.project.domain.PageDTO;

public interface ClientDAO {
	public List<ClientDTO> getClientInfo(PageDTO pageDTO);

	// 검색어
	public int getClientCount(PageDTO pageDTO);

	public void deleteClient(String cli_cd);

	public void insertClient(ClientDTO clientDTO);

	public ClientDTO getClient(String cli_cd);

	public void updateClient(ClientDTO clientDTO);

	public int clientDupCheck(String cli_num);

}
