package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.PageDTO;
import com.project.domain.PerformanceDTO;

@Repository
public class PerformanceDAOImpl implements PerformanceDAO {

	// 마이바티스 자동 객체생성
	@Inject
	private SqlSession sqlSession;

	// sql구문 전체 이름 정의
	private static final String namespace = "com.project.mappers.performanceMapper";

	@Override
	public List<PerformanceDTO> performanceCurrentInfo(PageDTO pageDTO) {
		System.out.println("PerformanceDAOImpl performanceCurrentInfo()");

		pageDTO.setStartRow(pageDTO.getStartRow() - 1);

		return sqlSession.selectList(namespace + ".performanceCurrentInfo", pageDTO);
	}

	@Override
	public int performanceCurrentCount() {
		System.out.println("PerformanceDAOImpl performanceCurrentCount()");

		return sqlSession.selectOne(namespace + ".performanceCurrentCount");
	}

	@Override
	public List<PerformanceDTO> perfCurrJsonList(String prod_cd) {
		System.out.println("PerformanceDAOImpl perfCurrJsonList()");
		
		return sqlSession.selectList(namespace + ".perfCurrJsonList", prod_cd);
	}
}
