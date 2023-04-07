package com.project.service;

import java.util.List;
import com.project.domain.ImatDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;

public interface ImatService {
	public List<ProductDTO> getImatprodList(PageDTO pageDTO);
	public int getImatCount();
	public List<ImatDTO> getImatbeList(PageDTO pageDTO);
	public List<ImatDTO> getIomatList(PageDTO pageDTO);
//	public List<ProductDTO> getImatxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxzzzzzzzzzzzxzxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzZZprodList1(PageDTO pageDTO);
	public void deleteList(String imat_cd);
	public void insertImat(ImatDTO imatDTO);
	public void updateImat(ImatDTO imatDTO);
	public ImatDTO getImat(String imat_cd);
}
