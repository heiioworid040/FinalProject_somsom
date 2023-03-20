package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.PageDTO;
import com.project.domain.WiDTO;

@Repository
public class WiDAOImpl implements WiDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.project.mappers.wiMapper";
	
	@Override
	public List<WiDTO> getWiList(PageDTO pageDTO) {
		System.out.println("WiDAOImpl getWiList()");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);

		return sqlSession.selectList(namespace+".getWiList", pageDTO);
	}
	
	
	@Override
	public int getWiCount() {
		System.out.println("WiDAOImpl getWiCount()");
		return sqlSession.selectOne(namespace+".getWiCount");
	}


	@Override
	public void getInfoWi(WiDTO wiDTO) {
		// TODO Auto-generated method stub
		
	}
}
