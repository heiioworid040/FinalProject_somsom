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

	@Override
	public void insertLine(LineDTO lineDTO) {
		System.out.println("LineServiceImpl insertLine()");
		if(lineDAO.getMaxLine() == null) {
			lineDTO.setLine_cd("L001");
		}else if(lineDAO.getMaxLine()<10){
			lineDTO.setLine_cd("L"+"00"+lineDAO.getMaxLine());
		}else if(lineDAO.getMaxLine()>9 && lineDAO.getMaxLine()<100){
			lineDTO.setLine_cd("L"+"0"+lineDAO.getMaxLine());
		}else {
			lineDTO.setLine_cd("L"+lineDAO.getMaxLine());
		}
		
		if(lineDTO.getLine_st() == null) {
			lineDTO.setLine_st("대기");
		}
		lineDAO.inertLine(lineDTO);
	}

	@Override
	public void updateLine(LineDTO lineDTO) {
		System.out.println("LineServiceImpl updateLine()");
		System.out.println(lineDTO);
		lineDAO.updateLine(lineDTO);
	}

	@Override
	public void deleteLine(String line_cd) {
		System.out.println("LineServiceImpl deleteLine()");
		lineDAO.deleteLine(line_cd);
	}

	
	
	
	


}
