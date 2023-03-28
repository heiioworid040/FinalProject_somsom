package com.project.dao;

import java.util.List;


import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;
import com.project.domain.ReqDTO;

public interface ReqDAO {
	//리스트
	public List<ReqDTO> getReqList(PageDTO pageDTO);
	//글개수
	public int getReqCount(PageDTO pageDTO);
	//글번호
	public ReqDTO getReq(int req_num);
	//생성
	public void insertReq(ReqDTO reqDTO);
	
	//글번호자동추가
	public Integer getMaxnum();
	
	//수정
	public void updateReq(ReqDTO reqDTO);
	//삭제
	public void deleteReq(int req_num);
}
