package com.project.service;

import java.util.List;

import com.project.domain.EmployeeDTO;
import com.project.domain.PageDTO;

public interface EmployeeService {

	public EmployeeDTO userCheck(EmployeeDTO employeeDTO);

	public List<EmployeeDTO> getEmployeeList(PageDTO pageDTO);

	public int getEmployeeCount(PageDTO pageDTO);

	public void insertEmployee(EmployeeDTO employeeDTO);

	public void deleteEmployee(String emp_cd);

	public EmployeeDTO getEmployee(String emp_cd);

	public void updateEmployee(EmployeeDTO employeeDTO);

	public EmployeeDTO emailCk(String emp_email);

	public EmployeeDTO telCk(String emp_tel);

	public void insertPass(String emp_tel);

	


}
