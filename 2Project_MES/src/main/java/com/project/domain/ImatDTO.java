package com.project.domain;


public class ImatDTO extends ProductDTO{

	private String imat_cd;
	private String prod_cd;
	
	private String imat_date;
	private String imat_stg;
	private int imat_count;
	private String cli_cd;
	private String cli_nm;
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
	public String getImat_date() {
		return imat_date;
	}
	public void setImat_date(String imat_date) {
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
	public String getCli_cd() {
		return cli_cd;
	}
	public void setCli_cd(String cli_cd) {
		this.cli_cd = cli_cd;
	}
	public String getCli_nm() {
		return cli_nm;
	}
	public void setCli_nm(String cli_nm) {
		this.cli_nm = cli_nm;
	}
	public String getImat_note() {
		return imat_note;
	}
	public void setImat_note(String imat_note) {
		this.imat_note = imat_note;
	}

}
