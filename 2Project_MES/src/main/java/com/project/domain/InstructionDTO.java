package com.project.domain;

import java.sql.Timestamp;

public class InstructionDTO extends LineDTO{

	private String inst_cd;
	private String inst_st;
	private Timestamp inst_date;
	private int inst_count;
	private int inst_fcount;
	
	// get set
	public String getInst_cd() {
		return inst_cd;
	}
	public void setInst_cd(String inst_cd) {
		this.inst_cd = inst_cd;
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
