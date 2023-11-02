package com.care.root.reservation.dto;

public class exhibitionBoardDTO {
	private int writeNo, hit;
	private String title, type, comname, ex_stDate, ex_endDate, ex_place, content, form, saveDate;
	public String getEx_stDate() {
		return ex_stDate;
	}
	public void setEx_stDate(String ex_stDate) {
		this.ex_stDate = ex_stDate;
	}
	public String getEx_endDate() {
		return ex_endDate;
	}
	public void setEx_endDate(String ex_endDate) {
		this.ex_endDate = ex_endDate;
	}
	public String getEx_place() {
		return ex_place;
	}
	public void setEx_place(String ex_place) {
		this.ex_place = ex_place;
	}
	private String imageName1, imageName2, imageName3, imageName4, imageName5;
	public String getImageName1() {
		return imageName1;
	}
	public void setImageName1(String imageName1) {
		this.imageName1 = imageName1;
	}
	public String getImageName2() {
		return imageName2;
	}
	public void setImageName2(String imageName2) {
		this.imageName2 = imageName2;
	}
	public String getImageName3() {
		return imageName3;
	}
	public void setImageName3(String imageName3) {
		this.imageName3 = imageName3;
	}
	public String getImageName4() {
		return imageName4;
	}
	public void setImageName4(String imageName4) {
		this.imageName4 = imageName4;
	}
	public String getImageName5() {
		return imageName5;
	}
	public void setImageName5(String imageName5) {
		this.imageName5 = imageName5;
	}
	public int getWriteNo() {
		return writeNo;
	}
	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getComname() {
		return comname;
	}
	public void setComname(String comname) {
		this.comname = comname;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}
	public String getSaveDate() {
		return saveDate;
	}
	public void setSaveDate(String saveDate) {
		this.saveDate = saveDate;
	}
}