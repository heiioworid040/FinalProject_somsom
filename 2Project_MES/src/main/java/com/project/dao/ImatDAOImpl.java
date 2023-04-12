package com.project.dao;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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



	@Override
	public int getImatCount(PageDTO pageDTO) {
		System.out.println("ImatDAOImp getImatCount()");
		return sqlSession.selectOne(namespace+".getImatCount",pageDTO);
	}

	@Override
	public int getIomatCount(PageDTO pageDTO) {
		System.out.println("ImatDAOImp getIomatCount()");
		return sqlSession.selectOne(namespace+".getIomatCount",pageDTO);
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
	@Override
	public ProductDTO getProd(String prod_cd) {
		System.out.println("ImatDAOImpl getProd()");

		return sqlSession.selectOne(namespace + ".getProd", prod_cd);
	}
}
