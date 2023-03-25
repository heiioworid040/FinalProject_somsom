package com.project.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.project.dao.ImatDAO;
import com.project.domain.ImatDTO;
import com.project.domain.PageDTO;

@Service
public class ImatServiceImpl implements ImatService{
	
	@Inject
	private ImatDAO imatDAO;
	

	
	@Override
	public int getImatCount() {
		System.out.println("ImatServiceImpl getImatCount()");
		return imatDAO.getImatCount();
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

}