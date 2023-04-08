package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.LineDAO;
import com.project.domain.LineDTO;
import com.project.domain.PageDTO;

@Service
public class LineServiceImpl implements LineService{

	@Inject
	private LineDAO lineDAO;

	@Override
	public List<LineDTO> getSearchLine() {
		System.out.println("LineServiceImpl getSearchLine()");

		return lineDAO.getSearchLine();
	}

	@Override
	public List<LineDTO> getLineList(PageDTO pageDTO) {
		System.out.println("LineServiceImpl getLineList()");
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;

		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		return lineDAO.getLineList(pageDTO);
	}

	@Override
	public int getLineCount(PageDTO pageDTO) {
		System.out.println("LineServiceImpl getLineCount()");

		return lineDAO.getLineCount(pageDTO);
	}



}
