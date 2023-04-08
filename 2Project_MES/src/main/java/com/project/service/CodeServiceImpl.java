package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.CodeDAO;
import com.project.domain.CodeDTO;
import com.project.domain.PageDTO;

@Service
public class CodeServiceImpl implements CodeService {

	@Inject
	private CodeDAO codeDAO;

	@Override
	public List<CodeDTO> getCodeGrpList(PageDTO pageDTO) {
		System.out.println("CodeServiceImpl getCodeGrpList()");
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;

			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);


		return codeDAO.getCodeGrpList(pageDTO);
	}

	@Override
	public int getCodeGrpCount() {
		System.out.println("CodeServiceImpl getCodeGrpCount()");
		return codeDAO.getCodeGrpCount();
	}

	@Override
	public List<CodeDTO> getCodeList(PageDTO pageDTO) {
		System.out.println("CodeServiceImpl getCodeList()");
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;

			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);


		return codeDAO.getCodeList(pageDTO);
	}

	@Override
	public int getCodeCount() {
		System.out.println("CodeServiceImpl getCodeCount()");

		return codeDAO.getCodeCount();
	}

	@Override
	public List<CodeDTO> getCodeList2(String code_grp) {
		System.out.println("CodeServiceImpl getCodeList2()");
		System.out.println(code_grp);
		return codeDAO.getCodeList2(code_grp);
	}

	@Override
	public void deleteCode(String code_cd) {
		System.out.println("CodeServiceImpl deleteCode");
		codeDAO.deleteCode(code_cd);
	}

	@Override
	public CodeDTO getCode(String code_grp) {
		System.out.println("CodeServiceImpl getCode()");

		return codeDAO.getCode(code_grp);
	}

	@Override
	public CodeDTO getCode2(String code_cd) {
		System.out.println("CodeServiceImpl getCode2()");
		return codeDAO.getCode2(code_cd);
	}

	@Override
	public void updateCode(CodeDTO codeDTO) {
		System.out.println("CodeServiceImpl updateCode()");
		codeDAO.updateCode(codeDTO);

	}

	@Override
	public List<CodeDTO> getCodeList3(String code_grp) {
		System.out.println("CodeServiceImpl getCodeList3()");
		System.out.println(code_grp);
		return codeDAO.getCodeList3(code_grp);
	}






}
