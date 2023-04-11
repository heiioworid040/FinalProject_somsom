package com.project.domain;

import java.sql.Timestamp;

public class ImatDTO extends ProductDTO{

	private int imat_num;

	private String imat_cd;
	private String prod_cd;
	private int iomat_count;
	private String prod_nm;
	
	private Timestamp imat_date;
	private String imat_stg;
	private int imat_count;
	private String cli_cd;
	private String cli_nm;
	private String imat_note;
	private String prod_unit;
	private String prod_mat;

	@Override
	public String getProd_nm() {
		return prod_nm;
	}
	@Override
	public void setProd_nm(String prod_nm) {
		this.prod_nm = prod_nm;
	}
	@Override
	public String getProd_mat() {
		return prod_mat;
	}
	@Override
	public void setProd_mat(String prod_mat) {
		this.prod_mat = prod_mat;
	}
	@Override
	public String getProd_unit() {
		return prod_unit;
	}
	@Override
	public void setProd_unit(String prod_unit) {
		this.prod_unit = prod_unit;
	}
	public int getIomat_count() {
		return iomat_count;
	}
	public void setIomat_count(int iomat_count) {
		this.iomat_count = iomat_count;
	}

	public int getImat_num() {
		return imat_num;
	}
	public void setImat_num(int imat_num) {
		this.imat_num = imat_num;
	}
	public String getImat_cd() {
		return imat_cd;
	}
	public void setImat_cd(String imat_cd) {
		this.imat_cd = imat_cd;
	}
	@Override
	public String getProd_cd() {
		return prod_cd;
	}
	@Override
	public void setProd_cd(String prod_cd) {
		this.prod_cd = prod_cd;
	}
	public Timestamp getImat_date() {
		return imat_date;
	}
	public void setImat_date(Timestamp timestamp) {
		this.imat_date = timestamp;
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
	public String getImat_note() {
		return imat_note;
	}
	public void setImat_note(String imat_note) {
		this.imat_note = imat_note;
	}

}
