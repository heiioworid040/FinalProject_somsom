package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;

@Repository
public class ProductDAOlmpl implements ProductDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	
	private static final String namespace="com.project.mappers.productMapper";
	
	@Override
	public void insertProduct(ProductDTO productDTO) {
		
		System.out.println("getProduct()");
		sqlSession.insert(namespace+".insertProduct",productDTO);
		
	}
	
	@Override
	public Integer getMaxnum() {
		
		return sqlSession.selectOne(namespace+".getMaxnum");
	}

	
	@Override
	public List<ProductDTO> getProductList(PageDTO pageDTO){
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
	return sqlSession.selectList(namespace+".getProductList",pageDTO);
	}
	
	@Override
	public int getProductCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getProductCount");
	}
	
	@Override
	public ProductDTO getProduct(int prod_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getProduct",prod_number);
	}

	@Override
	public void updateProduct(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".updateProduct",productDTO);
	}

	@Override
	public void deleteProduct(int prod_number) {
		sqlSession.delete(namespace+".deleteProduct",prod_number);
	}


	
}
