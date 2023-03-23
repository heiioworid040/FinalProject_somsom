package com.project.service;

import java.util.List;

import com.project.domain.PageDTO;
import com.project.domain.ShipDTO;

public interface ShipService {
	public List<ShipDTO> shipCurrentInfo(PageDTO pageDTO);

	public int shipCurrentCount();
}
