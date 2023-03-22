package com.project.domain;

import java.sql.Timestamp;

public class InstructionDTO extends LineDTO{
	private String inst_cd;
	private String inst_st;
	private Timestamp inst_date;
	private int inst_count;
	private int inst_fcount;
	
//	private String line_cd;
//	private String line_nm;
	
//	private String prod_cd;
//	private String prod_nm;
//	private String prod_unit;
//	
//	private String ord_cd;
//	
//	private String cli_cd;
	
	
	
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
//	public String getLine_cd() {
//		return line_cd;
//	}
//	public void setLine_cd(String line_cd) {
//		this.line_cd = line_cd;
//	}
//	public String getLine_nm() {
//		return line_nm;
//	}
//	public void setLine_nm(String line_nm) {
//		this.line_nm = line_nm;
//	}
//	public String getProd_cd() {
//		return prod_cd;
//	}
//	public void setProd_cd(String prod_cd) {
//		this.prod_cd = prod_cd;
//	}
//	public String getProd_nm() {
//		return prod_nm;
//	}
//	public void setProd_nm(String prod_nm) {
//		this.prod_nm = prod_nm;
//	}
//	public String getProd_unit() {
//		return prod_unit;
//	}
//	public void setProd_unit(String prod_unit) {
//		this.prod_unit = prod_unit;
//	}
//	public String getOrd_cd() {
//		return ord_cd;
//	}
//	public void setOrd_cd(String ord_cd) {
//		this.ord_cd = ord_cd;
//	}
//	public String getCli_cd() {
//		return cli_cd;
//	}
//	public void setCli_cd(String cli_cd) {
//		this.cli_cd = cli_cd;
//	}
	
}// WiDTO
