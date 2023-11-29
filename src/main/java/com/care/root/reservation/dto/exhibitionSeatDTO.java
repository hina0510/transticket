package com.care.root.reservation.dto;

import java.util.List;

public class exhibitionSeatDTO {
	private int exS_num, exS_price, exS_write;
	private String exS_id, ex_title, ex_date, ex_place, ex_buyer, ex_payed;
	private String exSr_id, exS_pwd;
	private List<String> seatList;

	public int getExS_write() {
		return exS_write;
	}
	public void setExS_write(int exS_write) {
		this.exS_write = exS_write;
	}
	public String getExS_id() {
		return exS_id;
	}
	public void setExS_id(String exS_id) {
		this.exS_id = exS_id;
	}
	public String getEx_buyer() {
		return ex_buyer;
	}
	public void setEx_buyer(String ex_buyer) {
		this.ex_buyer = ex_buyer;
	}
	public String getEx_payed() {
		return ex_payed;
	}
	public void setEx_payed(String ex_payed) {
		this.ex_payed = ex_payed;
	}
	public List<String> getSeatList() {
		return seatList;
	}
	public void setSeatList(List<String> seatList) {
		this.seatList = seatList;
	}
	public int getExS_num() {
		return exS_num;
	}
	public void setExS_num(int exS_num) {
		this.exS_num = exS_num;
	}
	public int getExS_price() {
		return exS_price;
	}
	public void setExS_price(int exS_price) {
		this.exS_price = exS_price;
	}
	public String getEx_title() {
		return ex_title;
	}
	public void setEx_title(String ex_title) {
		this.ex_title = ex_title;
	}
	public String getEx_date() {
		return ex_date;
	}
	public void setEx_date(String ex_date) {
		this.ex_date = ex_date;
	}
	public String getEx_place() {
		return ex_place;
	}
	public void setEx_place(String ex_place) {
		this.ex_place = ex_place;
	}
	public String getExSr_id() {
		return exSr_id;
	}
	public void setExSr_id(String exSr_id) {
		this.exSr_id = exSr_id;
	}
	public String getExS_pwd() {
		return exS_pwd;
	}
	public void setExS_pwd(String exS_pwd) {
		this.exS_pwd = exS_pwd;
	}
}
