package com.project.domain;

import java.sql.Timestamp;

public class PerformanceDTO extends InstructionDTO {
	private String perf_cd;
	private String inst_cd;
	private Timestamp perf_date;
	private int perf_good;
	private int perf_err;
	private String perf_cause;
	private String perf_note;
	private String line_nm;
	private String r_prod_cd;
	private String r_prod_nm;
	private String r_prod_unit;
	private String req_req;

	public String getPerf_cd() {
		return perf_cd;
	}
	public void setPerf_cd(String perf_cd) {
		this.perf_cd = perf_cd;
	}
	public String getInst_cd() {
		return inst_cd;
	}
	public void setInst_cd(String inst_cd) {
		this.inst_cd = inst_cd;
	}
	public Timestamp getPerf_date() {
		return perf_date;
	}
	public void setPerf_date(Timestamp perf_date) {
		this.perf_date = perf_date;
	}
	public int getPerf_good() {
		return perf_good;
	}
	public void setPerf_good(int perf_good) {
		this.perf_good = perf_good;
	}
	public int getPerf_err() {
		return perf_err;
	}
	public void setPerf_err(int perf_err) {
		this.perf_err = perf_err;
	}
	public String getPerf_cause() {
		return perf_cause;
	}
	public void setPerf_cause(String perf_cause) {
		this.perf_cause = perf_cause;
	}
	public String getPerf_note() {
		return perf_note;
	}
	public void setPerf_note(String perf_note) {
		this.perf_note = perf_note;
	}
	public String getLine_nm() {
		return line_nm;
	}
	public void setLine_nm(String line_nm) {
		this.line_nm = line_nm;
	}
	public String getR_prod_cd() {
		return r_prod_cd;
	}
	public void setR_prod_cd(String r_prod_cd) {
		this.r_prod_cd = r_prod_cd;
	}
	public String getR_prod_nm() {
		return r_prod_nm;
	}
	public void setR_prod_nm(String r_prod_nm) {
		this.r_prod_nm = r_prod_nm;
	}
	public String getR_prod_unit() {
		return r_prod_unit;
	}
	public void setR_prod_unit(String r_prod_unit) {
		this.r_prod_unit = r_prod_unit;
	}
	public String getReq_req() {
		return req_req;
	}
	public void setReq_req(String req_req) {
		this.req_req = req_req;
	}
}
