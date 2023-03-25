package com.project.service;

import java.util.List;
import com.project.domain.ImatDTO;
import com.project.domain.PageDTO;

public interface ImatService {

	public int getImatCount();
	public List<ImatDTO> getImatbeList(PageDTO pageDTO);

}
