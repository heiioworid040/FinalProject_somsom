package com.project.dao;

import java.util.List;

import com.project.domain.ClientDTO;
import com.project.domain.PageDTO;

public interface ClientDAO {
	public List<ClientDTO> getClientInfo(PageDTO pageDTO);

	public int getClientCount();
	
	public void deleteClient(String cli_cd);
}
