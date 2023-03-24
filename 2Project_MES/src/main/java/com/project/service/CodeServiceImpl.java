package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.CodeDAO;
import com.project.domain.CodeDTO;
import com.project.domain.PageDTO;

@Service
public class CodeServiceImpl implements CodeService {

	@Inject
	private CodeDAO codeDAO;
	
	@Override
	public List<CodeDTO> getCodeGrpList(PageDTO pageDTO) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
			
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
		
			
		return codeDAO.getCodeList(pageDTO);
	}

	@Override
	public int getCodeGrpCount() {
		System.out.println("CodeServiceImpl getCodeCount()");
		return codeDAO.getCodeCount();
	}

	
}
