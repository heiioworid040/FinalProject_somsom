package com.project.dao;

import java.util.List;

import com.project.domain.CodeDTO;
import com.project.domain.PageDTO;

public interface CodeDAO {

	List<CodeDTO> getCodeGrpList(PageDTO pageDTO);

	int getCodeGrpCount();

	List<CodeDTO> getCodeList(PageDTO pageDTO);

	int getCodeCount();

	List<CodeDTO> getCodeList2(String code_grp);

	void deleteCode(String code_cd);

	CodeDTO getCode(String code_grp);

	CodeDTO getCode2(String code_cd);

	void updateCode(CodeDTO codeDTO);

	List<CodeDTO> getCodeList3(String code_grp);

}
