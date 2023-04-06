package com.project.dao;
import org.springframework.stereotype.Repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.project.domain.OmatDTO;
import com.project.domain.OmatDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;

@Repository
public class OmatDAOImpl implements OmatDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.project.mappers.OmatMapper";
	
	@Override
	public void insertOmat(OmatDTO omatDTO) {
		System.out.println("OmatDAOImpl insertOmat()");
		
		sqlSession.insert(namespace+".insertOmat", omatDTO);
	}


	@Override
	public List<OmatDTO> getOmatbeList(PageDTO pageDTO) {
		System.out.println("OmatDAOImpl getOmatbeList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		System.out.println("OmatDAOImpl getOmatbeList()-1");
		return sqlSession.selectList(namespace+".getOmatbeList", pageDTO);
		
	}
	
	@Override
	public List<ProductDTO> getOmatprodList1(PageDTO pageDTO) {
		System.out.println("OmatDAOImpl getOmatprodList1()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getOmatprodList1", pageDTO);
		
	}

	@Override
	public int getOmatCount() {
		System.out.println("OmatDAOImp getOmatCount()");
		System.out.println("OmatDAOImpl getOmatbeList()-2");
		return sqlSession.selectOne(namespace+".getOmatCount");
	}
	
	
	@Override
	public void deleteList(String omat_cd) {
	    System.out.println("OmatDAOImpl deleteList()");
	    
	    sqlSession.delete(namespace+".deleteList", omat_cd);
	}

	@Override
	public List<ProductDTO> getOmatprodList(PageDTO pageDTO) {
		System.out.println("OmatDAOImpl getOmatbeList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getOmatprodList", pageDTO);
	}



	@Override
	public void updateOmat(OmatDTO omatDTO) {
		System.out.println("OmatDAOImpl updateOmat()");
		sqlSession.update(namespace+".updateOmat", omatDTO);
		
	}


	@Override
	public OmatDTO getOmat(String omat_cd) {
		System.out.println("OmatDAOImpl getOmat()");

		return sqlSession.selectOne(namespace + ".getOmat", omat_cd);
	}


}
