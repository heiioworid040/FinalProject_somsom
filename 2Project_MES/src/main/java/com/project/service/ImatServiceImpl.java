package com.project.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.ImatDAO;
import com.project.domain.ImatDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;

@Service
public class ImatServiceImpl implements ImatService{

	@Inject
	private ImatDAO imatDAO;



	@Override
	public int getImatCount(PageDTO pageDTO) {
		System.out.println("ImatServiceImpl getImatCount()");
		return imatDAO.getImatCount(pageDTO);
	}

	@Override
	public ImatDTO getImat(String imat_cd) {
		System.out.println("ImatServiceImpl getImat()");

		return imatDAO.getImat(imat_cd);
	}
	@Override
	public ProductDTO getProd(String prod_cd) {
		System.out.println("ImatServiceImpl getProd()");

		return imatDAO.getProd(prod_cd);
	}
	
	@Override
	public List<ImatDTO> getImatbeList(PageDTO pageDTO) {
		System.out.println("ImatServiceimpl getImatbeList()");
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		System.out.println("ImatServiceImpl getImatCount()-1");
		return imatDAO.getImatbeList(pageDTO);
	}

	@Override
	public List<ImatDTO> getIomatList(PageDTO pageDTO) {
		System.out.println("ImatServiceimpl getIomatList()");
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		System.out.println("ImatServiceImpl getImatCount()-1");
		return imatDAO.getIomatList(pageDTO);
	}

//	@Override
//	public List<ProductDTO> getImatprodList1(PageDTO pageDTO) {
//		System.out.println("ImatServiceimpl getImatprodList1()");
//		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
//		int endRow = startRow+pageDTO.getPageSize()-1;
//		pageDTO.setStartRow(startRow);
//		pageDTO.setEndRow(endRow);
//		System.out.println("ImatServiceImpl getImatCount()-1");
//		return imatDAO.getImatprodList1(pageDTO);
//	}

	@Override
	public List<ProductDTO> getImatprodList(PageDTO pageDTO) {
		System.out.println("ImatServiceimpl getImatprodList()");
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		System.out.println("ImatServiceImpl getImatCount()-1");
		return imatDAO.getImatprodList(pageDTO);
	}

	@Override
	public void deleteList(String imat_cd) {
		System.out.println("ImatServiceImpl deleteList()");

		imatDAO.deleteList(imat_cd);
	}


	@Override
	public void insertImat(ImatDTO imatDTO) {
		System.out.println("ImatServiceImpl insertImat()");
		String imatcd=null;
		if(imatDAO.getMaxCd()==null) {
			imatDTO.setImat_cd("MI001");
		}else {
			imatcd="MI"+String.format("%03d", imatDAO.getMaxCd()+1);
		}

		// 현시스템 날짜 저장하는 처리작업
		imatDTO.setImat_cd(imatcd);
		imatDTO.setImat_date(new Timestamp(System.currentTimeMillis()));

		//회원가입 디비 부모인터페이스 MemberDAO,
		//           자식클래스 MemberDAOImpl
		// 리턴할형 없음 insertMember(MemberDTO memberDTO) 메서드 정의
		// 메서드 호출
		imatDAO.insertImat(imatDTO);
	}

	@Override
	public void updateImat(ImatDTO imatDTO) {
		System.out.println("ImatServiceImpl updateimat()");

		imatDAO.updateImat(imatDTO);
	}

}