package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.LineDTO;
import com.project.domain.PageDTO;

@Repository
public class LineDAOImpl implements LineDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.project.mappers.lineMapper";

	@Override
	public List<LineDTO> getSearchLine() {
		System.out.println("LineDAOImpl getSearchLine()");
		
		return sqlSession.selectList(namespace+".getSearchLine");
	}

	@Override
	public List<LineDTO> getInstList(PageDTO pageDTO) {
		System.out.println("LineDAOImpl getLineList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getLineList");
	}

	@Override
	public int getLineCount() {
		System.out.println("LineDAOImpl getLineCount()");
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getLineCount");
	}
	
	
}
