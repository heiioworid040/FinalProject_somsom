package com.project.dao;

import java.util.List;
import com.project.domain.ImatDTO;
import com.project.domain.PageDTO;

public interface ImatDAO {
	
	public List<ImatDTO> getImatbeList(PageDTO pageDTO);

	public int getImatCount();

}
