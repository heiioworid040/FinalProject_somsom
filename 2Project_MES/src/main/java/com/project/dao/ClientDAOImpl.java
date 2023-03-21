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
	public int getClientCount() {
		System.out.println("ClientDAOImpl getClientCount()");

		return sqlSession.selectOne(namespace + ".getClientCount");
	}

	@Override
	public void deleteClient(String cli_cd) {
		System.out.println("ClientDAOImpl deleteClient()");
		
		sqlSession.delete(namespace+".deleteClient", cli_cd);
	}

}
