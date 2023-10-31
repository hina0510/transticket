package com.care.root.board.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.board.dto.GenBoardDTO;

public interface GenBoardService {
	public String IMAGE_REPO = "c:/spring/images";
	public  Map<String, Object> boardAllList(int num);
	public GenBoardDTO genView(int writeNo);
	public void genDelete(int writeNo);
}
