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
	
	
	
}
