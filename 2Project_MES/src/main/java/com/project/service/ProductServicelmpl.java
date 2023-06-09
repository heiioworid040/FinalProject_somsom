package com.project.service;



import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.ProductDAO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;

// 부모인터페이스를 자동화 처리
@Service
public class ProductServicelmpl implements ProductService{

	// DAO 값 받아옴
	@Inject
	private ProductDAO productDAO;



	@Override
	public void insertProduct(ProductDTO productDTO) {
		// 폼에서 가져온 값 name, content, subject

		// num, readcount, date, file => 설정
		// num = > max(num)+1;
		if(productDAO.getMaxnum() == null) {
			//게시판 글 없음 => 1 설정
			productDTO.setProd_number(1);
		}else {
			//게시판 글 있음 =>max(num)+1
			productDTO.setProd_number(productDAO.getMaxnum()+1);
		}



		System.out.println("boardservice insertBoard");

		//DAO.insertDTO 호출
		productDAO.insertProduct(productDTO);
	}


	@Override
	public List<ProductDTO> getProductList(PageDTO pageDTO) {
		System.out.println("Productservice getProductList");
		// limit #{startRow-1} . #{pageSzie} 1~10 , 2~11
		int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;

		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);

		return productDAO.getProductList(pageDTO);
	}




	@Override
	public int getProductCount(PageDTO pageDTO) {

		System.out.println("getProductCount");
		return productDAO.getProductCount(pageDTO);
	}


	@Override
	public ProductDTO getProduct(int prod_number) {
		System.out.println("getProduct");


		return productDAO.getProduct(prod_number);
	}


	@Override
	public void updateProduct(ProductDTO productDTO) {
		System.out.println("ProductDTO updatePro");

		productDAO.updateProduct(productDTO);

	}

	@Override
	public void deleteProduct(int prod_number) {

		productDAO.deleteProduct(prod_number);

	}


	@Override
	public Integer getMaxnum() {
		// TODO Auto-generated method stub
		return null;
	}
}
