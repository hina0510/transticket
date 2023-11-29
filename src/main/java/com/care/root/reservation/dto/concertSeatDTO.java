package com.care.root.reservation.dto;

import java.util.List;

public class concertSeatDTO {
	private int conS_num, conS_price, conS_write;
	private String conS_id, con_title, con_date, con_place, con_buyer, con_payed;
	private String conSr_id, conS_pwd;
	private List<String> seatList;
	
	public int getConS_write() {
		return conS_write;
	}
	public void setConS_write(int conS_write) {
		this.conS_write = conS_write;
	}
	public String getCon_payed() {
		return con_payed;
	}
	public void setCon_payed(String con_payed) {
		this.con_payed = con_payed;
	}
	public String getCon_buyer() {
		return con_buyer;
	}
	public void setCon_buyer(String con_buyer) {
		this.con_buyer = con_buyer;
	}
	public List<String> getSeatList() {
		return seatList;
	}
	public void setSeatList(List<String> seatList) {
		this.seatList = seatList;
	}
	public int getConS_num() {
		return conS_num;
	}
	public void setConS_num(int conS_num) {
		this.conS_num = conS_num;
	}
	public int getConS_price() {
		return conS_price;
	}
	public void setConS_price(int conS_price) {
		this.conS_price = conS_price;
	}
	public String getConS_id() {
		return conS_id;
	}
	public void setConS_id(String conS_id) {
		this.conS_id = conS_id;
	}
	public String getConSr_id() {
		return conSr_id;
	}
	public void setConSr_id(String conSr_id) {
		this.conSr_id = conSr_id;
	}
	public String getConS_pwd() {
		return conS_pwd;
	}
	public void setConS_pwd(String conS_pwd) {
		this.conS_pwd = conS_pwd;
	}
	public String getCon_title() {
		return con_title;
	}
	public void setCon_title(String con_title) {
		this.con_title = con_title;
	}
	public String getCon_date() {
		return con_date;
	}
	public void setCon_date(String con_date) {
		this.con_date = con_date;
	}
	public String getCon_place() {
		return con_place;
	}
	public void setCon_place(String con_place) {
		this.con_place = con_place;
	}
}
