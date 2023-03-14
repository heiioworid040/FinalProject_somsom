package com.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.project.dao.TestDAO;
import com.project.domain.TestDTO;

@Repository
public class TestServiceImpl implements TestService{
	
	private TestDAO testDAO;
	
	@Inject
	public void setTestDAO(TestDAO testDAO) {
		this.testDAO = testDAO;
	}

	@Override
	public void insertTest(TestDTO testDTO) {
		System.out.println("TestServiceImpl insertTest()");
		
		testDAO.insertTest(testDTO);
	}
	
	
}
