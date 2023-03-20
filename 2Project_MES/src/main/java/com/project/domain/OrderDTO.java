package com.project.domain;

import java.sql.Timestamp;

public class OrderDTO {
	private int ord_num;
	private String prod_cd;
	private String emp_cd;
	private Timestamp ord_date; 
	private Timestamp ord_d_date;
	private int ord_count;
	
	// set get
	public int getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(int ord_num) {
		this.ord_num = ord_num;
	}
	public String getProd_cd() {
		return prod_cd;
	}
	public void setProd_cd(String prod_cd) {
		this.prod_cd = prod_cd;
	}
	public String getEmp_cd() {
		return emp_cd;
	}
	public void setEmp_cd(String emp_cd) {
		this.emp_cd = emp_cd;
	}
	public Timestamp getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Timestamp ord_date) {
		this.ord_date = ord_date;
	}
	public Timestamp getOrd_d_date() {
		return ord_d_date;
	}
	public void setOrd_d_date(Timestamp ord_d_date) {
		this.ord_d_date = ord_d_date;
	}
	public int getOrd_count() {
		return ord_count;
	}
	public void setOrd_count(int ord_count) {
		this.ord_count = ord_count;
	}
	
	
}
