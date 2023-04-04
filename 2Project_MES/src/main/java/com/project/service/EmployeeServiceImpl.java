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
	public int getEmployeeCount(PageDTO pageDTO) {
		System.out.println("EmployeeServiceImpl getEmployeeCount()");
		System.out.println("search"+pageDTO.getSearch());
		return employeeDAO.getEmployeeCount(pageDTO);
	}

	@Override
	public void insertEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeServiceImpl insertEmployee()");
		
		if(employeeDAO.getMaxNum() == null) {	
			employeeDTO.setEmp_cd("00"+1);
		}else if(employeeDAO.getMaxNum()>=99) {
			employeeDTO.setEmp_cd(""+(employeeDAO.getMaxNum()+1));
		}else if(employeeDAO.getMaxNum()>=9) {
			employeeDTO.setEmp_cd("0"+(employeeDAO.getMaxNum()+1));		
		}else {
			employeeDTO.setEmp_cd("00"+(employeeDAO.getMaxNum()+1));
		}

		
		
		
		employeeDAO.insertEmployee(employeeDTO);
		
	}

	@Override
	public void deleteEmployee(String emp_cd) {
		System.out.println("EmployeeServiceImpl deleteEmployee()");
		employeeDAO.deleteEmployee(emp_cd);
		
	}

	@Override
	public EmployeeDTO getEmployee(String emp_cd) {
		System.out.println("EmployeeServiceImpl getEmployee()");
		return employeeDAO.getEmployee(emp_cd);
	}

	@Override
	public void updateEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeServiceImpl updateEmployee()");
		employeeDAO.updateEmployee(employeeDTO);
	}

	@Override
	public EmployeeDTO emailCk(String emp_email) {
		System.out.println("EmployeeServiceImpl emailCk()");
		return employeeDAO.emailCk(emp_email);
	}

	@Override
	public EmployeeDTO telCk(String emp_tel) {
		System.out.println("EmployeeServiceImpl telCk()");
		return employeeDAO.telCk(emp_tel);
	}

	@Override
	public void insertPass(String emp_tel) {
		System.out.println("EmployeeServiceImpl insertPass");
		employeeDAO.insertPass(emp_tel);
	}


	
	







}
