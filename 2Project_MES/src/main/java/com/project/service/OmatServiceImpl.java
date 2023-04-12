package com.project.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.OmatDAO;
import com.project.domain.OmatDTO;

import com.project.domain.OmatDTO;
import com.project.domain.OmatDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;

@Service
public class OmatServiceImpl implements OmatService{

	@Inject
	private OmatDAO omatDAO;



	@Override
	public int getOmatCount(PageDTO pageDTO) {
		System.out.println("OmatServiceImpl getOmatCount()");
		return omatDAO.getOmatCount(pageDTO);
	}

	@Override
	public OmatDTO getOmat(String omat_cd) {
		System.out.println("OmatServiceImpl getOmat()");

		return omatDAO.getOmat(omat_cd);
	}
	
	@Override
	public ProductDTO getProd(String prod_cd) {
		System.out.println("ImatServiceImpl getProd()");

		return omatDAO.getProd(prod_cd);
	}
	
	@Override
	public List<OmatDTO> getOmatbeList(PageDTO pageDTO) {
		System.out.println("OmatServiceimpl getOmatbeList()");
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		System.out.println("OmatServiceImpl getOmatCount()-1");
		return omatDAO.getOmatbeList(pageDTO);
	}

	@Override
	public List<ProductDTO> getOmatprodList1(PageDTO pageDTO) {
		System.out.println("OmatServiceimpl getOmatprodList1()");
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		System.out.println("OmatServiceImpl getOmatCount()-1");
		return omatDAO.getOmatprodList1(pageDTO);
	}

	@Override
	public List<ProductDTO> getOmatprodList(PageDTO pageDTO) {
		System.out.println("OmatServiceimpl getOmatprodList()");
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		System.out.println("OmatServiceImpl getOmatCount()-1");
		return omatDAO.getOmatprodList(pageDTO);
	}

	@Override
	public void deleteList(String omat_cd) {
		System.out.println("OmatServiceImpl deleteList()");

		omatDAO.deleteList(omat_cd);
	}


	@Override
	public void insertOmat(OmatDTO omatDTO) {
		System.out.println("OmatServiceImpl insertOmat()");
		String omatcd=null;
		if(omatDAO.getMaxCd()==null) {
			omatDTO.setOmat_cd("MO001");
		}else {
			omatcd="MO"+String.format("%03d", omatDAO.getMaxCd()+1);
		}
		
		// 현시스템 날짜 저장하는 처리작업
		omatDTO.setOmat_cd(omatcd);
		omatDTO.setOmat_date(new Timestamp(System.currentTimeMillis()));

		//회원가입 디비 부모인터페이스 MemberDAO,
		//           자식클래스 MemberDAOImpl
		// 리턴할형 없음 insertMember(MemberDTO memberDTO) 메서드 정의
		// 메서드 호출
		omatDAO.insertOmat(omatDTO);
	}

	@Override
	public void updateOmat(OmatDTO omatDTO) {
		System.out.println("OmatServiceImpl updateomat()");

		omatDAO.updateOmat(omatDTO);
	}

}