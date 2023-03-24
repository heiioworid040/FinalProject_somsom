package com.project.dao;

import java.util.List;

import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;

public interface ProductDAO {
	public void insertProduct(ProductDTO productDTO);

	public List<ProductDTO> getProductList(PageDTO pageDTO);
	
	public Integer getMaxnum();
	
	public int getProductCount();
	
	public ProductDTO getProduct(int prod_number);
	
	public void updateProduct(ProductDTO productDTO);
	
	public void deleteProduct(int prod_number);
	

	
	
	
	

}
