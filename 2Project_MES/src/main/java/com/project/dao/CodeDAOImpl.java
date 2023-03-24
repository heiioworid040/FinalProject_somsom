package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.CodeDTO;
import com.project.domain.PageDTO;

@Repository
public class CodeDAOImpl implements CodeDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.project.mappers.codeMapper";
	
	@Override
	public List<CodeDTO> getCodeList(PageDTO pageDTO) {
		System.out.println("CodeDAOImpl getCodeList()");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);

		return sqlSession.selectList(namespace+".getCodeList", pageDTO);
	}

	@Override
	public int getCodeCount() {
		System.out.println("CodeDAOImpl getCodeCount()");

		return sqlSession.selectOne(namespace+".getCodeCount");
	}

}
