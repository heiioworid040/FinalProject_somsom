package com.project.domain;

import com.google.protobuf.Timestamp;

public class ImatDTO {

	private String imat_cd;
	private String prod_cd;
	private Timestamp imat_date;
	private String imat_stg;
	private int imat_count;
	private String imat_note;
	public String getImat_cd() {
		return imat_cd;
	}
	public void setImat_cd(String imat_cd) {
		this.imat_cd = imat_cd;
	}
	public String getProd_cd() {
		return prod_cd;
	}
	public void setProd_cd(String prod_cd) {
		this.prod_cd = prod_cd;
	}
	public Timestamp getImat_date() {
		return imat_date;
	}
	public void setImat_date(Timestamp imat_date) {
		this.imat_date = imat_date;
	}
	public String getImat_stg() {
		return imat_stg;
	}
	public void setImat_stg(String imat_stg) {
		this.imat_stg = imat_stg;
	}
	public int getImat_count() {
		return imat_count;
	}
	public void setImat_count(int imat_count) {
		this.imat_count = imat_count;
	}
	public String getImat_note() {
		return imat_note;
	}
	public void setImat_note(String imat_note) {
		this.imat_note = imat_note;
	}
}
