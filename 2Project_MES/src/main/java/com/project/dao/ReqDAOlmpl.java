package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.PageDTO;
import com.project.domain.ReqDTO;



@Repository
public class ReqDAOlmpl implements ReqDAO{

	@Inject
	private SqlSession sqlSession;


	private static final String namespace="com.project.mappers.reqMapper";


	@Override
	public List<ReqDTO> getReqList(PageDTO pageDTO){

		pageDTO.setStartRow(pageDTO.getStartRow()-1);

		return sqlSession.selectList(namespace+".getReqList",pageDTO);
	}

	@Override
	public int getReqCount(PageDTO pageDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getReqCount",pageDTO);
	}

	@Override
	public ReqDTO getReq(int req_num) {

		return sqlSession.selectOne(namespace+".getReq",req_num);
	}

	@Override
	public void insertReq(ReqDTO reqDTO) {

		System.out.println("req insert");
		sqlSession.insert(namespace + ".insertReq", reqDTO);
	}

	@Override
	public Integer getMaxnum() {

		return sqlSession.selectOne(namespace+".getMaxnum");
	}

	@Override
	public void updateReq(ReqDTO reqDTO) {
			System.out.println("req_num : "+reqDTO.getReq_num());
		sqlSession.update(namespace+".updateReq",reqDTO);

	}

	@Override
	public void deleteReq(int req_num) {

		sqlSession.delete(namespace+".deleteReq",req_num);

	}



}
