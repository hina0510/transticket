package com.care.root.reservation.dto;

import java.util.List;

public class musicalSeatDTO {
	private int muS_num, muS_price;
	private String muS_id01, muS_id02, muS_id03, muS_id04, muS_id05, mu_title, mu_date, mu_place;
	private String muSr_id, muS_pwd;
	private List<String> seatList;
	
	public List<String> getSeatList() {
		return seatList;
	}
	public void setSeatList(List<String> seatList) {
		this.seatList = seatList;
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
	public String getMuS_id01() {
		return muS_id01;
	}
	public void setMuS_id01(String muS_id01) {
		this.muS_id01 = muS_id01;
	}
	public String getMuS_id02() {
		return muS_id02;
	}
	public void setMuS_id02(String muS_id02) {
		this.muS_id02 = muS_id02;
	}
	public String getMuS_id03() {
		return muS_id03;
	}
	public void setMuS_id03(String muS_id03) {
		this.muS_id03 = muS_id03;
	}
	public String getMuS_id04() {
		return muS_id04;
	}
	public void setMuS_id04(String muS_id04) {
		this.muS_id04 = muS_id04;
	}
	public String getMuS_id05() {
		return muS_id05;
	}
	public void setMuS_id05(String muS_id05) {
		this.muS_id05 = muS_id05;
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
}
