package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.EmployeeDTO;
import com.project.domain.PageDTO;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.project.mappers.employeeMapper";

	@Override
	public EmployeeDTO userCheck(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeDAOImpl userCheck()");
		return sqlSession.selectOne(namespace+".userCheck", employeeDTO);
	}

	@Override
	public List<EmployeeDTO> getEmployeeList(PageDTO pageDTO) {
		System.out.println("EmployeeDAOImpl getEmployeeList()");

		pageDTO.setStartRow(pageDTO.getStartRow()-1);

		return sqlSession.selectList(namespace+".getEmployeeList", pageDTO);
	}

	@Override
	public int getEmployeeCount(PageDTO pageDTO) {
		System.out.println("EmployeeDAOImpl getEmployeeCount()");
		System.out.println("search"+pageDTO.getSearch());
		return sqlSession.selectOne(namespace+".getEmployeeCount", pageDTO);
	}

	@Override
	public void insertEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeDAOImpl insertEmployee()");


		sqlSession.insert(namespace+".insertEmployee", employeeDTO);
	}

	@Override
	public void deleteEmployee(String emp_cd) {
		System.out.println("EmployeeDAOImpl deleteEmployee()");
		sqlSession.delete(namespace+".deleteEmployee", emp_cd);

	}


	@Override
	public EmployeeDTO getEmployee(String emp_cd) {
		System.out.println("EmployeeDAOImpl getEmployee()");
		System.out.println(emp_cd);
		return sqlSession.selectOne(namespace+".getEmployee", emp_cd);
	}

	@Override
	public void updateEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeDAOImpl updateEmployee()");
		sqlSession.update(namespace+".updateEmployee", employeeDTO);

	}

	@Override
	public Integer getMaxNum() {
		System.out.println("EmployeeDAOImpl getMaxNum()");
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public EmployeeDTO emailCk(String emp_email) {
		System.out.println("EmployeeDAOImpl emailCk()");
		return sqlSession.selectOne(namespace+".emailCk",emp_email);
	}

	@Override
	public EmployeeDTO telCk(String emp_tel) {
		System.out.println("EmployeeDAOImpl telCk()");
		return sqlSession.selectOne(namespace+".telCk",emp_tel);
	}

	@Override
	public void insertPass(String emp_tel) {
		System.out.println("EmployeeDAOImpl insertPass()");
		sqlSession.update(namespace+".insertPass",emp_tel);

	}








}
