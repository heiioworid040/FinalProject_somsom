package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.EmployeeDAO;
import com.project.domain.EmployeeDTO;
import com.project.domain.PageDTO;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Inject
	private EmployeeDAO employeeDAO;
	
	@Override
	public EmployeeDTO userCheck(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeServiceImpl userCheck()");
		return employeeDAO.userCheck(employeeDTO);
	}

	@Override
	public List<EmployeeDTO> getEmployeeList(PageDTO pageDTO) {
		System.out.println("EmployeeImpl getEmployeeList()");
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
			
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
		
			
		return employeeDAO.getEmployeeList(pageDTO);
	}

	@Override
	public int getEmployeeCount() {
		System.out.println("EmployeeServiceImpl getEmployeeCount()");
		return employeeDAO.getEmployeeCount();
	}

	@Override
	public void insertEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeServiceImpl insertEmployee()");
		
		employeeDAO.insertEmployee(employeeDTO);
		
	}

	@Override
	public void deleteEmployee(String emp_cd) {
		System.out.println("EmployeeServiceImpl deleteEmployee()");
		employeeDAO.deleteEmployee(emp_cd);
		
	}

	@Override
	public List<EmployeeDTO> getUpdateList() {
		System.out.println("EmployeeServiceImpl getUpdateList()" );		
		return employeeDAO.getUpdateList();
	}

	@Override
	public void updateEmployee(String emp_cd) {
		// TODO Auto-generated method stub
		
	}





}
