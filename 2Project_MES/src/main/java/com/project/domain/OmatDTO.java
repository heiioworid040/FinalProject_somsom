package com.project.domain;

import java.sql.Timestamp;

public class OmatDTO extends ProductDTO{

	private int omat_num;

	private String omat_cd;
	private String prod_cd;

	private Timestamp omat_date;
	private String omat_stg;
	private int omat_count;
	private String cli_cd;
	private String cli_nm;
	private String omat_note;

	public int getOmat_num() {
		return omat_num;
	}
	public void setOmat_num(int omat_num) {
		this.omat_num = omat_num;
	}
	public String getOmat_cd() {
		return omat_cd;
	}
	public void setOmat_cd(String omat_cd) {
		this.omat_cd = omat_cd;
	}
	@Override
	public String getProd_cd() {
		return prod_cd;
	}
	@Override
	public void setProd_cd(String prod_cd) {
		this.prod_cd = prod_cd;
	}
	public Timestamp getOmat_date() {
		return omat_date;
	}
	public void setOmat_date(Timestamp timestamp) {
		this.omat_date = timestamp;
	}
	public String getOmat_stg() {
		return omat_stg;
	}
	public void setOmat_stg(String omat_stg) {
		this.omat_stg = omat_stg;
	}
	public int getOmat_count() {
		return omat_count;
	}
	public void setOmat_count(int omat_count) {
		this.omat_count = omat_count;
	}
	@Override
	public String getCli_cd() {
		return cli_cd;
	}
	@Override
	public void setCli_cd(String cli_cd) {
		this.cli_cd = cli_cd;
	}
	@Override
	public String getCli_nm() {
		return cli_nm;
	}
	@Override
	public void setCli_nm(String cli_nm) {
		this.cli_nm = cli_nm;
	}
	public String getOmat_note() {
		return omat_note;
	}
	public void setOmat_note(String omat_note) {
		this.omat_note = omat_note;
	}

}
