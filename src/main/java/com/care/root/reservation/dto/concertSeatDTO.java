package com.care.root.reservation.dto;

import java.util.List;

public class concertSeatDTO {
	private int conS_num, conS_price;
	private String conS_id01, conS_id02, conS_id03, conS_id04, conS_id05, con_title, con_date, con_place;
	private String conSr_id, conS_pwd;
	private List<String> seatList;
	
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
	public String getConS_id01() {
		return conS_id01;
	}
	public void setConS_id01(String conS_id01) {
		this.conS_id01 = conS_id01;
	}
	public String getConS_id02() {
		return conS_id02;
	}
	public void setConS_id02(String conS_id02) {
		this.conS_id02 = conS_id02;
	}
	public String getConS_id03() {
		return conS_id03;
	}
	public void setConS_id03(String conS_id03) {
		this.conS_id03 = conS_id03;
	}
	public String getConS_id04() {
		return conS_id04;
	}
	public void setConS_id04(String conS_id04) {
		this.conS_id04 = conS_id04;
	}
	public String getConS_id05() {
		return conS_id05;
	}
	public void setConS_id05(String conS_id05) {
		this.conS_id05 = conS_id05;
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
