package com.project.service;

import java.util.List;

import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;

public interface ProductService {
	
	public void insertProduct(ProductDTO productDTO);
	
	public Integer getMaxnum();	
	
	public List<ProductDTO> getProductList(PageDTO pageDTO);
	
	public ProductDTO getProduct(int prod_number);
	
	public void updateProduct(ProductDTO productDTO);
	
	public void deleteProduct(int prod_number);
	
	public int getProductCount(PageDTO pageDTO);
	

}
