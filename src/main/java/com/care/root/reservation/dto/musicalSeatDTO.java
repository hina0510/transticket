package com.care.root.reservation.dto;

import java.util.List;

public class musicalSeatDTO {
	private int muS_num, muS_price, muS_write;
	private String muS_id, mu_title, mu_date, mu_place, mu_buyer, mu_payed;
	private String muSr_id, muS_pwd;
	private List<String> seatList;

	public int getMuS_write() {
		return muS_write;
	}
	public void setMuS_write(int muS_write) {
		this.muS_write = muS_write;
	}
	public int getMuS_num() {
		return muS_num;
	}
	public void setMuS_num(int muS_num) {
		this.muS_num = muS_num;
	}
	public int getMuS_price() {
		return muS_price;
	}
	public void setMuS_price(int muS_price) {
		this.muS_price = muS_price;
	}
	public String getMuS_id() {
		return muS_id;
	}
	public void setMuS_id(String muS_id) {
		this.muS_id = muS_id;
	}
	public String getMu_buyer() {
		return mu_buyer;
	}
	public void setMu_buyer(String mu_buyer) {
		this.mu_buyer = mu_buyer;
	}
	public String getMu_payed() {
		return mu_payed;
	}
	public void setMu_payed(String mu_payed) {
		this.mu_payed = mu_payed;
	}
	public String getMu_title() {
		return mu_title;
	}
	public void setMu_title(String mu_title) {
		this.mu_title = mu_title;
	}
	public String getMu_date() {
		return mu_date;
	}
	public void setMu_date(String mu_date) {
		this.mu_date = mu_date;
	}
	public String getMu_place() {
		return mu_place;
	}
	public void setMu_place(String mu_place) {
		this.mu_place = mu_place;
	}
	public String getMuSr_id() {
		return muSr_id;
	}
	public void setMuSr_id(String muSr_id) {
		this.muSr_id = muSr_id;
	}
	public String getMuS_pwd() {
		return muS_pwd;
	}
	public void setMuS_pwd(String muS_pwd) {
		this.muS_pwd = muS_pwd;
	}
	public List<String> getSeatList() {
		return seatList;
	}
	public void setSeatList(List<String> seatList) {
		this.seatList = seatList;
	}
}
