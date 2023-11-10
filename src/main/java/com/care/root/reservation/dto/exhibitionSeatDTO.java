package com.care.root.reservation.dto;

import java.util.List;

public class exhibitionSeatDTO {
	private int exS_num, exS_price;
	private String exS_id01, exS_id02, exS_id03, exS_id04, exS_id05, ex_title, ex_date, ex_place;
	private String exSr_id, exS_pwd;
	private List<String> seatList;
	
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
	public String getExS_id01() {
		return exS_id01;
	}
	public void setExS_id01(String exS_id01) {
		this.exS_id01 = exS_id01;
	}
	public String getExS_id02() {
		return exS_id02;
	}
	public void setExS_id02(String exS_id02) {
		this.exS_id02 = exS_id02;
	}
	public String getExS_id03() {
		return exS_id03;
	}
	public void setExS_id03(String exS_id03) {
		this.exS_id03 = exS_id03;
	}
	public String getExS_id04() {
		return exS_id04;
	}
	public void setExS_id04(String exS_id04) {
		this.exS_id04 = exS_id04;
	}
	public String getExS_id05() {
		return exS_id05;
	}
	public void setExS_id05(String exS_id05) {
		this.exS_id05 = exS_id05;
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
}
