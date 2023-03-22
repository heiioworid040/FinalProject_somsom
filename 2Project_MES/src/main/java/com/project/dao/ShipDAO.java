package com.project.dao;

import java.util.List;

import com.project.domain.PageDTO;
import com.project.domain.ShipDTO;

public interface ShipDAO {
	public List<ShipDTO> shipCurrentInfo(PageDTO pageDTO);

	public int shipCurrentCount();
}
