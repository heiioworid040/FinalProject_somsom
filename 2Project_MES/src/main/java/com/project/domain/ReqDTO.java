package com.project.domain;

import java.sql.Timestamp;

public class ReqDTO {
	
	private int req_num; //소요량 기본키
	private String req_req; //소요량 
	private String req_add_emp; //등록자
	private Timestamp req_add_date; //등록일
	private String req_edit_emp; //등록자
	private Timestamp req_edit_date; //등록일
	
	public int getReq_num() {
		return req_num;
	}
	public void setReq_num(int req_num) {
		this.req_num = req_num;
	}
	public String getReq_req() {
		return req_req;
	}
	public void setReq_req(String req_req) {
		this.req_req = req_req;
	}
	public String getReq_add_emp() {
		return req_add_emp;
	}
	public void setReq_add_emp(String req_add_emp) {
		this.req_add_emp = req_add_emp;
	}
	public Timestamp getReq_add_date() {
		return req_add_date;
	}
	public void setReq_add_date(Timestamp req_add_date) {
		this.req_add_date = req_add_date;
	}
	public String getReq_edit_emp() {
		return req_edit_emp;
	}
	public void setReq_edit_emp(String req_edit_emp) {
		this.req_edit_emp = req_edit_emp;
	}
	public Timestamp getReq_edit_date() {
		return req_edit_date;
	}
	public void setReq_edit_date(Timestamp req_edit_date) {
		this.req_edit_date = req_edit_date;
	}
	
}
