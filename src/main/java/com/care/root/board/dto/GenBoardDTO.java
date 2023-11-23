package com.care.root.board.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class GenBoardDTO {
	private int WriteNo, viewCount, likes;
	private String category, title, content, id, saveDate;
	private String imageName1, imageName2, imageName3, imageName4, imageName5;
	
	public int getWriteNo() {
		return WriteNo;
	}
	public void setWriteNo(int writeNo) {
		WriteNo = writeNo;
	}
	public int getViewCount() {
		return viewCount;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSaveDate() {
		return saveDate;
	}
	public void setSaveDate(Timestamp saveDate) {
		SimpleDateFormat fo = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		this.saveDate = fo.format(saveDate);
	}
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

}
