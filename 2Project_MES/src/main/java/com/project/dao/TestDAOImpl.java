package com.project.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.TestDTO;

@Repository
public class TestDAOImpl implements TestDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	static final String namespace="com.project.mappers.testMapper";
	
	@Override
	public void insertTest(TestDTO testDTO) {
		System.out.println("TestDAOImpl insertTest()");
		
		sqlSession.insert(namespace+".insertTest", testDTO);
		
	}

}
