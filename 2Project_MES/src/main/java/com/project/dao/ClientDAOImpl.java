package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.ClientDTO;
import com.project.domain.PageDTO;

@Repository
public class ClientDAOImpl implements ClientDAO {

	// 마이바티스 자동 객체생성
	@Inject
	private SqlSession sqlSession;

	// sql구문 전체 이름 정의
	private static final String namespace = "com.project.mappers.clientMapper";

	@Override
	public List<ClientDTO> getClientInfo(PageDTO pageDTO) {
		System.out.println("ClientDAOImpl getClientInfo()");

		pageDTO.setStartRow(pageDTO.getStartRow() - 1);

		return sqlSession.selectList(namespace + ".getClientInfo", pageDTO);
	}

	@Override
	public int getClientCount(PageDTO pageDTO) {
		System.out.println("ClientDAOImpl getClientCount()");

		return sqlSession.selectOne(namespace + ".getClientCount", pageDTO);
	}

	@Override
	public void deleteClient(String cli_cd) {
		System.out.println("ClientDAOImpl deleteClient()");

		sqlSession.delete(namespace + ".deleteClient", cli_cd);
	}

	@Override
	public void insertClient(ClientDTO clientDTO) {
		System.out.println("ClientDAOImpl insertClient()");

		sqlSession.insert(namespace + ".insertClient", clientDTO);
	}

	@Override
	public ClientDTO getClient(String cli_cd) {
		System.out.println("ClientDAOImpl getClient()");

		return sqlSession.selectOne(namespace + ".getClient", cli_cd);
	}

	@Override
	public void updateClient(ClientDTO clientDTO) {
		System.out.println("ClientDAOImpl updateClient()");

		sqlSession.update(namespace + ".updateClient", clientDTO);

	}

	@Override
	public int clientDupCheck(String cli_num) {
		System.out.println("ClientDAOImpl clientDupCheck()");
		
		return sqlSession.selectOne(namespace + ".clientDupCheck", cli_num);
	}

}
