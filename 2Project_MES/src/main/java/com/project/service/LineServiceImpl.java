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

}
