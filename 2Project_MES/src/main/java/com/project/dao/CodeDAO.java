package com.project.dao;

import java.util.List;

import com.project.domain.CodeDTO;
import com.project.domain.PageDTO;

public interface CodeDAO {

	List<CodeDTO> getCodeList(PageDTO pageDTO);

	int getCodeCount();

}
