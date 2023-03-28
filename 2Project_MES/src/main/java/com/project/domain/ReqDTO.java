package com.project.domain;

import java.sql.Date;

public class ReqDTO extends ProductDTO{
	
	private int req_num; //소요량 기본키
	private String req_req; //소요량 
	private String req_add_emp; //등록자
	private Date req_add_date; //등록일
	private String req_edit_emp; //등록자
	private Date req_edit_date; //등록일
	private String prod_fcd;
	private String prod_fnm;
	
	
	@Override
	public String toString() {
		return "ReqDTO [req_num=" + req_num + ", req_req=" + req_req + ", req_add_emp=" + req_add_emp
				+ ", req_add_date=" + req_add_date + ", req_edit_emp=" + req_edit_emp + ", req_edit_date="
				+ req_edit_date + ", prod_fcd=" + prod_fcd + ", prod_fnm=" + prod_fnm + "]";
	}
	
	public String getProd_fnm() {
		return prod_fnm;
	}
	public void setProd_fnm(String prod_fnm) {
		this.prod_fnm = prod_fnm;
	}
	public String getProd_fcd() {
		return prod_fcd;
	}
	public void setProd_fcd(String prod_fcd) {
		this.prod_fcd = prod_fcd;
	}
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
	
	public String getReq_edit_emp() {
		return req_edit_emp;
	}
	public void setReq_edit_emp(String req_edit_emp) {
		this.req_edit_emp = req_edit_emp;
	}
	public Date getReq_add_date() {
		return req_add_date;
	}
	public void setReq_add_date(Date req_add_date) {
		this.req_add_date = req_add_date;
	}
	public Date getReq_edit_date() {
		return req_edit_date;
	}
	public void setReq_edit_date(Date req_edit_date) {
		this.req_edit_date = req_edit_date;
	}
	
	
}
