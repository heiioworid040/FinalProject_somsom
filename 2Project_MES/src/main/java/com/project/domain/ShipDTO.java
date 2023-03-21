package com.project.domain;

public class ShipDTO extends OrderDTO {
	private String ship_cd;
	private int ship_ifcount;
	private int ship_count;
	private int ship_over;
	private int ship_inven;
	private int ship_date;
	
	public String getShip_cd() {
		return ship_cd;
	}
	public void setShip_cd(String ship_cd) {
		this.ship_cd = ship_cd;
	}
	public int getShip_ifcount() {
		return ship_ifcount;
	}
	public void setShip_ifcount(int ship_ifcount) {
		this.ship_ifcount = ship_ifcount;
	}
	public int getShip_count() {
		return ship_count;
	}
	public void setShip_count(int ship_count) {
		this.ship_count = ship_count;
	}
	public int getShip_over() {
		return ship_over;
	}
	public void setShip_over(int ship_over) {
		this.ship_over = ship_over;
	}
	public int getShip_inven() {
		return ship_inven;
	}
	public void setShip_inven(int ship_inven) {
		this.ship_inven = ship_inven;
	}
	public int getShip_date() {
		return ship_date;
	}
	public void setShip_date(int ship_date) {
		this.ship_date = ship_date;
	}
}
