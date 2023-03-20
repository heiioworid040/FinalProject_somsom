package com.project.service;



import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.ProductDAO;
import com.project.domain.ProductDTO;

// 부모인터페이스를 자동화 처리
@Service
public class ProductServicelmpl implements ProductService{
	
	// DAO 값 받아옴
	@Inject
	private ProductDAO productDAO;

	@Override
	public void insertProduct(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		
	}
	

	
}
