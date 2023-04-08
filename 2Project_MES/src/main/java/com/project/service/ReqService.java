package com.project.service;

import java.util.List;

import com.project.domain.PageDTO;
import com.project.domain.ReqDTO;

public interface ReqService {

	//추상매서드
	public List<ReqDTO> getReqList(PageDTO pageDTO);

	public ReqDTO getReq(int req_num);

	public int getReqCount(PageDTO pageDTO);

	public void insertReq(ReqDTO reqDTO);

	//글번호 추가
	public Integer getMaxnum();

	//수정
	public void updateReq(ReqDTO reqDTO);
	//삭제
	public void deleteReq(int req_num);
}
