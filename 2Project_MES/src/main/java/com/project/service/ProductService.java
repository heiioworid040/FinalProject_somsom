package com.project.service;

import java.util.List;


import com.project.domain.ProductDTO;

public interface ProductService {
	
	public void insertProduct(ProductDTO productDTO);
	
	public List<ProductDTO> getProductList();
}
