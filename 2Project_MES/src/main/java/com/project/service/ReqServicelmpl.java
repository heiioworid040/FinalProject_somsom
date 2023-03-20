package com.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.ReqDAO;
import com.project.domain.ReqDTO;

// 부모인터페이스를 자동화 처리
@Service
public class ReqServicelmpl implements ReqService{
	
	// DAO 값 받아옴
	@Inject
	private ReqDAO reqDAO;
	
	@Override
	public void insertReq(ReqDTO reqdto) {
		// 폼에서 가져온 값 name, content, subject
	
	}

	

	
}
