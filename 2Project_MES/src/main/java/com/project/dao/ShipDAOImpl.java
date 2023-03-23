package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.PageDTO;
import com.project.domain.ShipDTO;

@Repository
public class ShipDAOImpl implements ShipDAO {

	// 마이바티스 자동 객체생성
	@Inject
	private SqlSession sqlSession;

	// sql구문 전체 이름 정의
	private static final String namespace = "com.project.mappers.shipMapper";

	@Override
	public List<ShipDTO> shipCurrentInfo(PageDTO pageDTO) {
		System.out.println("ShipDAOImpl shipCurrentInfo()");

		pageDTO.setStartRow(pageDTO.getStartRow() - 1);

		return sqlSession.selectList(namespace + ".shipCurrentInfo", pageDTO);
	}

	@Override
	public int shipCurrentCount() {
		System.out.println("ShipDAOImpl shipCurrentCount()");

		return sqlSession.selectOne(namespace + ".shipCurrentCount");
	}

	@Override
	public void currDelete(String ship_cd) {
		System.out.println("ShipDAOImpl currDelete()");

		sqlSession.delete(namespace + ".currDelete", ship_cd);

	}

}
