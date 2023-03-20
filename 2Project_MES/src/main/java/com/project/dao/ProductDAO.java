package com.project.dao;

import java.util.List;

import com.project.domain.ProductDTO;

public interface ProductDAO {
	public void insertProduct(ProductDTO productDTO);

	public List<ProductDTO> getProductList();
	

}
