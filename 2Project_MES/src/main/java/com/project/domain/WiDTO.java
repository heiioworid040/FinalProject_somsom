package com.project.domain;

import com.google.protobuf.Timestamp;

public class WiDTO {
	private String inst_cd;
	private String line_cd;
	private int ord_num;
	private String inst_st;
	private Timestamp inst_date;
	private int inst_count;
	private int inst_fcount;
	
	// getset
	public String getInst_cd() {
		return inst_cd;
	}
	public void setInst_cd(String inst_cd) {
		this.inst_cd = inst_cd;
	}
	public String getLine_cd() {
		return line_cd;
	}
	public void setLine_cd(String line_cd) {
		this.line_cd = line_cd;
	}
	public int getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(int ord_num) {
		this.ord_num = ord_num;
	}
	public String getInst_st() {
		return inst_st;
	}
	public void setInst_st(String inst_st) {
		this.inst_st = inst_st;
	}
	public Timestamp getInst_date() {
		return inst_date;
	}
	public void setInst_date(Timestamp inst_date) {
		this.inst_date = inst_date;
	}
	public int getInst_count() {
		return inst_count;
	}
	public void setInst_count(int inst_count) {
		this.inst_count = inst_count;
	}
	public int getInst_fcount() {
		return inst_fcount;
	}
	public void setInst_fcount(int inst_fcount) {
		this.inst_fcount = inst_fcount;
	}
	
	
}// WiDTO
