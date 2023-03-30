package com.project.service;

import java.util.List;

import com.project.domain.PageDTO;
import com.project.domain.ShipDTO;

public interface ShipService {
	public List<ShipDTO> shipCurrentInfo(PageDTO pageDTO);

	// 검색어
	public int shipCurrentCount(PageDTO pageDTO);

	public void currDelete(String ship_cd);

	public List<ShipDTO> shipInfo(PageDTO pageDTO);

	public void shipInfoPro(ShipDTO shipDTO);
}
