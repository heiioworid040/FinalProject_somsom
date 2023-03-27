package com.project.service;

import java.util.List;

import com.project.domain.CodeDTO;
import com.project.domain.PageDTO;

public interface CodeService {

	public List<CodeDTO> getCodeGrpList(PageDTO pageDTO);

	public int getCodeGrpCount();

	public List<CodeDTO> getCodeList(PageDTO pageDTO);

	public int getCodeCount();

	public List<CodeDTO> getCodeList2(String code_grp);

	public void deleteCode(String code_cd);

	public CodeDTO getCode(String code_grp);

	public CodeDTO getCode2(String code_cd);

	public void updateCode(CodeDTO codeDTO);




	}

