package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.OrderDTO;
import com.project.domain.PageDTO;

@Repository
public class OrderDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.project.mappers.OrderMapper";
	
	public List<OrderDTO> getOrderInsertList(PageDTO pageDTO) {
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getOrderInsertList", pageDTO);
	}

	public List<OrderDTO> getOrderList(PageDTO pageDTO) {
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getOrderList", pageDTO);
	}

	public List<OrderDTO> getOrderList(PageDTO pageDTO, String cli_cd) {
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getOrderList_cli_cd", cli_cd);
	}
	
	public int getOrderCount() {
		return sqlSession.selectOne(namespace+".getOrderCount");
	}
	
	public List<OrderDTO> getOrderPop(PageDTO pageDTO) {
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getOrderPop", pageDTO);
	}
}