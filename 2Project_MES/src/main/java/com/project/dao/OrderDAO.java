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
	public int getOrderCount() {
		return sqlSession.selectOne(namespace+".getOrderCount");
	}
	
	//수주 추가 수주번호
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
	public void orderDel(OrderDTO orderDTO) {
		sqlSession.delete(namespace+".orderDel",orderDTO);
	}

	//수주 현황
	public List<OrderDTO> getOrderList(PageDTO pageDTO) {
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getOrderList", pageDTO);
	}

	//수주 현황 검색 수정 중
	public List<OrderDTO> getOrderList(PageDTO pageDTO, String cli_cd) {
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getOrderList_cli_cd", cli_cd);
	}
	
	//수주 관리 팝업
	public List<OrderDTO> getOrderPop(PageDTO pageDTO) {
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getOrderPop", pageDTO);
	}


}