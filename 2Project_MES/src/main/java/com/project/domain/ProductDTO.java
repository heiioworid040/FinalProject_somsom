package com.project.domain;

public class ProductDTO {
	
	private String prod_cd; //상품코드
	private String prod_nm; //상품이름
	private String prod_mat; //자재유형
	private String prod_unit; //단위
	private String prod_text; //재질
	private String prod_size; //규격
	private int prod_inprice; //매입단가
	private int prod_outprice; //매출단가
	private int prod_count; //현재 개수
	private String prod_note; //비고(이유)
	
	public String getProd_cd() {
		return prod_cd;
	}
	public void setProd_cd(String prod_cd) {
		this.prod_cd = prod_cd;
	}
	public String getProd_nm() {
		return prod_nm;
	}
	public void setProd_nm(String prod_nm) {
		this.prod_nm = prod_nm;
	}
	public String getProd_mat() {
		return prod_mat;
	}
	public void setProd_mat(String prod_mat) {
		this.prod_mat = prod_mat;
	}
	public String getProd_unit() {
		return prod_unit;
	}
	public void setProd_unit(String prod_unit) {
		this.prod_unit = prod_unit;
	}
	public String getProd_text() {
		return prod_text;
	}
	public void setProd_text(String prod_text) {
		this.prod_text = prod_text;
	}
	public String getProd_size() {
		return prod_size;
	}
	public void setProd_size(String prod_size) {
		this.prod_size = prod_size;
	}
	public int getProd_inprice() {
		return prod_inprice;
	}
	public void setProd_inprice(int prod_inprice) {
		this.prod_inprice = prod_inprice;
	}

	public String getProd_note() {
		return prod_note;
	}
	public void setProd_note(String prod_note) {
		this.prod_note = prod_note;
	}
	public int getProd_count() {
		return prod_count;
	}
	public void setProd_count(int prod_count) {
		this.prod_count = prod_count;
	}
	public int getProd_outprice() {
		return prod_outprice;
	}
	public void setProd_outprice(int prod_outprice) {
		this.prod_outprice = prod_outprice;
	}
	
	
	

}
