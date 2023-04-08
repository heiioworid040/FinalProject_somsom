package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.CodeDTO;
import com.project.domain.PageDTO;

@Repository
public class CodeDAOImpl implements CodeDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.project.mappers.codeMapper";

	@Override
	public List<CodeDTO> getCodeGrpList(PageDTO pageDTO) {
		System.out.println("CodeDAOImpl getCodeGrpList()");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);

		return sqlSession.selectList(namespace+".getCodeGrpList", pageDTO);
	}

	@Override
	public int getCodeGrpCount() {
		System.out.println("CodeDAOImpl getCodeGrpCount()");

		return sqlSession.selectOne(namespace+".getCodeGrpCount");
	}

	@Override
	public List<CodeDTO> getCodeList(PageDTO pageDTO) {
		System.out.println("CodeDAOImpl getCodeList()");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);

		return sqlSession.selectList(namespace+".getCodeList", pageDTO);
	}

	@Override
	public int getCodeCount() {
		System.out.println("CodeDAOImpl getCodeCount()");

		return sqlSession.selectOne(namespace+".getCodeCount");

	}

	@Override
	public List<CodeDTO> getCodeList2(String code_grp) {
		System.out.println("CodeDAOImpl getCodeList2()");
		System.out.println(code_grp);
		return sqlSession.selectList(namespace+".getCodeList2", code_grp);
	}

	@Override
	public void deleteCode(String code_cd) {
		System.out.println("CodeDAOImpl deleteCode()");
		sqlSession.delete(namespace+".deleteCode", code_cd);

	}

	@Override
	public CodeDTO getCode(String code_grp) {
		System.out.println("CodeDAOImpl getCode()");
		return sqlSession.selectOne(namespace+".getCode",code_grp);
	}

	@Override
	public CodeDTO getCode2(String code_cd) {
		System.out.println("CodeDAOImpl getCode2()");
		return sqlSession.selectOne(namespace+".getCode2",code_cd);
	}

	@Override
	public void updateCode(CodeDTO codeDTO) {
		System.out.println("CodeDAOImpl updateCode()");
		sqlSession.update(namespace+".updateCode", codeDTO);
	}

	@Override
	public List<CodeDTO> getCodeList3(String code_grp) {
		System.out.println("CodeDAOImpl getCodeList3()");
		System.out.println(code_grp);
		return sqlSession.selectList(namespace+".getCodeList3", code_grp);
	}


}
