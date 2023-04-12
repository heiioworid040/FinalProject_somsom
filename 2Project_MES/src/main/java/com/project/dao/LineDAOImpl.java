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
	public List<LineDTO> getLineList(PageDTO pageDTO) {
		System.out.println("LineDAOImpl getLineList()");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);

		return sqlSession.selectList(namespace+".getLineList", pageDTO);
	}

	@Override
	public int getLineCount(PageDTO pageDTO) {
		System.out.println("LineDAOImpl getLineCount()");
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getLineCount", pageDTO);
	}

	@Override
	public void inertLine(LineDTO lineDTO) {
		System.out.println("LineDAOImpl insertLine()");
		
		sqlSession.insert(namespace+".insertLine", lineDTO);
	}

	@Override
	public Integer getMaxLine() {
		System.out.println("LineDAOImpl getMaxLine()");
		return sqlSession.selectOne(namespace+".getMaxLine");
	}

	@Override
	public void updateLine(LineDTO lineDTO) {
		System.out.println("LineDAOImpl updateLine()");
		sqlSession.update(namespace+".updateLine", lineDTO);
	}

	@Override
	public void deleteLine(String line_cd) {
		System.out.println("LineDAOImpl deleteLine()");
		sqlSession.delete(namespace+".deleteLine", line_cd);
	}
	
	
	
	

}
