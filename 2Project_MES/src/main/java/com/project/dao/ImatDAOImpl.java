package com.project.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import com.project.domain.ImatDTO;
import com.project.domain.PageDTO;

@Repository
public class ImatDAOImpl implements ImatDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.project.mappers.ImatMapper";
	
	

	@Override
	public List<ImatDTO> getImatbeList(PageDTO pageDTO) {
		System.out.println("ImatDAOImpl getImatbeList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		System.out.println("ImatDAOImpl getImatbeList()-1");
		return sqlSession.selectList(namespace+".getImatbeList", pageDTO);
		
	}

	@Override
	public int getImatCount() {
		System.out.println("ImatDAOImp getImatCount()");
		System.out.println("ImatDAOImpl getImatbeList()-2");
		return sqlSession.selectOne(namespace+".getImatCount");
	}
}
