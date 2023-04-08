package com.project.dao;

import java.util.List;

import com.project.domain.ClientDTO;
import com.project.domain.ImatDTO;
import com.project.domain.OmatDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;

public interface OmatDAO {
	
	public List<OmatDTO> getOmatbeList(PageDTO pageDTO);

	public int getOmatCount();
	
	public Integer getMaxCd();
	
	public OmatDTO getOmat(String omat_cd);
	
	public ProductDTO getProd(String prod_cd);

	public void deleteList(String omat_cd);
	
	public void insertOmat(OmatDTO omatDTO);
	
	public void updateOmat(OmatDTO omatDTO);
	
	public List<ProductDTO> getOmatprodList(PageDTO pageDTO);

	List<ProductDTO> getOmatprodList1(PageDTO pageDTO);

}
