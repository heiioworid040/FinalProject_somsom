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
	public int shipCurrentCount(PageDTO pageDTO) {
		System.out.println("ShipDAOImpl shipCurrentCount()");

		return sqlSession.selectOne(namespace + ".shipCurrentCount", pageDTO);
	}

	@Override
	public void currDelete(String ship_cd) {
		System.out.println("ShipDAOImpl currDelete()");

		sqlSession.delete(namespace + ".currDelete", ship_cd);

	}

	@Override
	public List<ShipDTO> shipInfo(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".shipInfo", pageDTO);
	}

	@Override
	public void shipInfoPro(ShipDTO shipDTO) {
		sqlSession.insert(namespace + ".shipInfoPro", shipDTO);
	}

	@Override
	public String getShipNum() {
		return sqlSession.selectOne(namespace + ".getShipNum");
	}

	@Override
	public Integer getMaxNum(ShipDTO shipDTO) {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}

}
