package com.project.dao;
import org.springframework.stereotype.Repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import com.project.domain.ImatDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;

@Repository
public class ImatDAOImpl implements ImatDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.project.mappers.ImatMapper";
	
	@Override
	public void insertImat(ImatDTO imatDTO) {
		System.out.println("ImatDAOImpl insertImat()");
		
		sqlSession.insert(namespace+".insertImat", imatDTO);
	}

	@Override
	public Integer getMaxCd() {
		System.out.println("ImatDAOImpl getMaxCd()");
		
		return sqlSession.selectOne(namespace+".getMaxCd");
	}

	@Override
	public List<ImatDTO> getImatbeList(PageDTO pageDTO) {
		System.out.println("ImatDAOImpl getImatbeList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		System.out.println("ImatDAOImpl getImatbeList()-1");
		return sqlSession.selectList(namespace+".getImatbeList", pageDTO);
		
	}
	
	@Override
	public List<ImatDTO> getIomatList(PageDTO pageDTO) {
		System.out.println("ImatDAOImpl getImatbeList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		System.out.println("ImatDAOImpl getImatbeList()-1");
		return sqlSession.selectList(namespace+".getIomatList", pageDTO);
		
	}
	
//	@Override
//	public List<ProductDTO> getImatprodList1(PageDTO pageDTO) {
//		System.out.println("ImatDAOImpl getImatprodList1()");
//		
//		pageDTO.setStartRow(pageDTO.getStartRow()-1);
//		return sqlSession.selectList(namespace+".getImatprodList1", pageDTO);
//		
//	}

	@Override
	public int getImatCount() {
		System.out.println("ImatDAOImp getImatCount()");
		System.out.println("ImatDAOImpl getImatbeList()-2");
		return sqlSession.selectOne(namespace+".getImatCount");
	}
	
	
	@Override
	public void deleteList(String imat_cd) {
	    System.out.println("ImatDAOImpl deleteList()");
	    
	    sqlSession.delete(namespace+".deleteList", imat_cd);
	}

	@Override
	public List<ProductDTO> getImatprodList(PageDTO pageDTO) {
		System.out.println("ImatDAOImpl getImatbeList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getImatprodList", pageDTO);
	}


	@Override
	public void updateImat(ImatDTO imatDTO) {
		System.out.println("ImatDAOImpl updateImat()");
		sqlSession.update(namespace+".updateImat", imatDTO);
		
	}


	@Override
	public ImatDTO getImat(String imat_cd) {
		System.out.println("ImatDAOImpl getImat()");

		return sqlSession.selectOne(namespace + ".getImat", imat_cd);
	}

}
