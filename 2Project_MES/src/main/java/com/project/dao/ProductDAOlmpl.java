package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public List<ProductDTO> getProductList(){
		
	return sqlSession.selectList(namespace+".getProductList");
	}
}
