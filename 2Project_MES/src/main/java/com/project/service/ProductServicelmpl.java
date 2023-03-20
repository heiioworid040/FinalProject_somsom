package com.project.service;



import java.sql.Timestamp;
import java.util.List;

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
		// 폼에서 가져온 값 name, content, subject
		
		// num, readcount, date, file => 설정
		// num = > max(num)+1;
//		if(productDAO.getMaxnum() == null) {
//			//게시판 글 없음 => 1 설정
//			productDTO.setNum(1);
//		}else {
//			//게시판 글 있음 =>max(num)+1
//			productDTO.setNum(productDAO.getMaxnum()+1);
//		}
//		
//		productDTO.setReadcount(0);
//		productDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		System.out.println("boardservice insertBoard");
		
		//DAO.insertDTO 호출
		productDAO.insertProduct(productDTO);
	}
	
	
	@Override
	public List<ProductDTO> getProductList() {
		// TODO Auto-generated method stub
		// limit #{startRow-1} . #{pageSzie} 1~10 , 2~11
	
		
		
		return productDAO.getProductList();
	}

	
}
