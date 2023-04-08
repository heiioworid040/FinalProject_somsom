package com.project.domain;

import java.sql.Timestamp;

public class ShipDTO extends OrderDTO {
	private String ship_cd;
	private String ord_cd;
	private int ship_ifcount;
	private int ship_count;
	private int ship_over;
	private int ship_inven;
	private Timestamp ship_date;

	public String getShip_cd() {
		return ship_cd;
	}
	public void setShip_cd(String ship_cd) {
		this.ship_cd = ship_cd;
	}
	@Override
	public String getOrd_cd() {
		return ord_cd;
	}
	@Override
	public void setOrd_cd(String ord_cd) {
		this.ord_cd = ord_cd;
	}
	public int getShip_ifcount() {
		return ship_ifcount;
	}
	public void setShip_ifcount(int ship_ifcount) {
		this.ship_ifcount = ship_ifcount;
	}
	@Override
	public int getShip_count() {
		return ship_count;
	}
	@Override
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
	public Timestamp getShip_date() {
		return ship_date;
	}
	public void setShip_date(Timestamp ship_date) {
		this.ship_date = ship_date;
	}

}