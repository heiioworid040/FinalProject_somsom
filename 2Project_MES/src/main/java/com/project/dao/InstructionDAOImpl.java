package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.PageDTO;
import com.project.domain.InstructionDTO;

@Repository
public class InstructionDAOImpl implements InstructionDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.project.mappers.instructionMapper";
	
	@Override
	public List<InstructionDTO> getInstList(PageDTO pageDTO) {
		System.out.println("InstDAOImpl getInstList()");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);

		return sqlSession.selectList(namespace+".getInstList", pageDTO);
	}
	
	
	@Override
	public int getInstCount() {
		System.out.println("InstDAOImpl getInstCount()");
		return sqlSession.selectOne(namespace+".getInstCount");
	}


	@Override
	public void insertInst(InstructionDTO instructionDTO) {
		System.out.println("InstDAOImpl insertInst()");
		
		sqlSession.insert(namespace+".insertInst", instructionDTO);
	}


	@Override
	public int maxInst() {
		System.out.println("InstDAOImpl maxInst()");
		
		return sqlSession.selectOne(namespace+".maxInst");
	}
	
}
