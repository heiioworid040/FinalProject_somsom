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
		System.out.println("ProductDAOImpl getProdList");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);

	return sqlSession.selectList(namespace+".getProductList",pageDTO);
	}

	@Override
	public int getProductCount(PageDTO pageDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getProductCount",pageDTO);
	}

	@Override
	public ProductDTO getProduct(int prod_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getProduct",prod_number);
	}

	@Override
	public void updateProduct(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		System.out.println("cd : "+productDTO.getProd_cd());
		System.out.println("count : "+productDTO.getProd_count());
		System.out.println("inprice : "+productDTO.getProd_inprice());
		System.out.println("mat : "+productDTO.getProd_mat());
		System.out.println("nm : "+productDTO.getProd_nm());
		System.out.println("note : "+productDTO.getProd_note());
		System.out.println("number : "+productDTO.getProd_number());
		System.out.println("outprice : "+productDTO.getProd_outprice());
		System.out.println("size : "+productDTO.getProd_size());




		sqlSession.update(namespace+".updateProduct",productDTO);
	}

	@Override
	public void deleteProduct(int prod_number) {
		sqlSession.delete(namespace+".deleteProduct",prod_number);
	}



}
