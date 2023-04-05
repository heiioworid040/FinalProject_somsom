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
	private static final String namespace="com.project.mappers.orderMapper";
	
	//수주 관리
	public List<OrderDTO> getOrderInsertList(PageDTO pageDTO) {
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getOrderInsertList", pageDTO);
	}

	//수주 관리 상세
	public OrderDTO getOrderInsert(String ord_cd) {
		return sqlSession.selectOne(namespace+".getOrderInsert", ord_cd);
	}
	
	//수주 총 카운트
	public int getOrderCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace+".getOrderCount", pageDTO);
	}
	
	//수주 추가 수주번호
	public String getOrdNum() {
		return sqlSession.selectOne(namespace+".getOrdNum");
	}
	
	public Integer getMaxNum(OrderDTO orderDTO) {
		return sqlSession.selectOne(namespace+".getMaxNum", orderDTO);
	}
	
	//수주 추가
	public void orderAdd(OrderDTO orderDTO) {
		sqlSession.insert(namespace+".orderAdd", orderDTO);
	}
	
	//수주 수정
	public void orderEdit(OrderDTO orderDTO) {
		sqlSession.update(namespace+".orderEdit",orderDTO);
	}

	//수주 삭제
	public void orderDel(String ord_cd) {
		sqlSession.delete(namespace+".orderDel",ord_cd);
	}

	//수주 현황
	public List<OrderDTO> getOrderList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getOrderList", pageDTO);
	}
	
	//팝업
	public List<OrderDTO> getSearchCli(PageDTO pageDTO) {
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getSearchCli", pageDTO);
	}
	
	public int getSearchCliCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace+".getSearchCliCount", pageDTO);
	}

	public List<OrderDTO> getSearchEmp(PageDTO pageDTO) {
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getSearchEmp", pageDTO);
	}
	
	public int getSearchEmpCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace+".getSearchEmpCount", pageDTO);
	}
	
	public List<OrderDTO> getSearchProd(PageDTO pageDTO) {
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getSearchProd", pageDTO);
	}
	
	public int getSearchProdCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace+".getSearchProdCount", pageDTO);
	}
}