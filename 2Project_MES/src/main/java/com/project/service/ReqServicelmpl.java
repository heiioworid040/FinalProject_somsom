package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.ReqDAO;
import com.project.domain.PageDTO;
import com.project.domain.ReqDTO;

// 부모인터페이스를 자동화 처리
@Service
public class ReqServicelmpl implements ReqService{
	
	// DAO 값 받아옴
	@Inject
	private ReqDAO reqDAO;
	
	@Override
	public List<ReqDTO> getReqList(PageDTO pageDTO) {
		// TODO Auto-generated method stub
		// limit #{startRow-1} . #{pageSzie} 1~10 , 2~11
		int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return reqDAO.getReqList(pageDTO);
	}
	
	
	@Override
	public int getReqCount(PageDTO pageDTO) {

		System.out.println("getReqCount");
		return reqDAO.getReqCount(pageDTO);
	}

	@Override
	public ReqDTO getReq(int req_num) {
		System.out.println("getReq");
		
		
		return reqDAO.getReq(req_num);
	}


	@Override
	public void insertReq(ReqDTO reqDTO) {
		System.out.println("insert Req");
		if(reqDAO.getMaxnum() == null) {
			//게시판 글 없음 => 1 설정
			reqDTO.setReq_num(1);
		}else {
			//게시판 글 있음 =>max(num)+1
			reqDTO.setReq_num(reqDAO.getMaxnum()+1);
		}
		System.out.println("reqservice insertreq");
		
		reqDAO.insertReq(reqDTO);
	}
	
	@Override
	public Integer getMaxnum() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void updateReq(ReqDTO reqDTO) {
		
		reqDAO.updateReq(reqDTO);
		
	}


	@Override
	public void deleteReq(int req_num) {
		reqDAO.deleteReq(req_num);
		
		
	}
	

	
}
