package com.project.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.EmployeeDTO;

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
	
}
