package com.project.service;

import java.util.List;

import com.project.domain.OmatDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;

public interface OmatService {
	public List<ProductDTO> getOmatprodList(PageDTO pageDTO);
	public int getOmatCount();
	public List<OmatDTO> getOmatbeList(PageDTO pageDTO);
	public List<ProductDTO> getOmatprodList1(PageDTO pageDTO);
	public void deleteList(String omat_cd);
	public void insertOmat(OmatDTO omatDTO);
	public void updateOmat(OmatDTO omatDTO);
	public OmatDTO getOmat(String omat_cd);
}
