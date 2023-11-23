package com.care.root.board.service;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.board.dto.GenBoardDTO;

public interface GenFileService {
	public String IMAGE_REPO="C:\\spring\\image_repo"; // C:/spring/image_repo
	public void saveImage(GenBoardDTO dto, MultipartFile[] files, String[] nan);
	public void modify(GenBoardDTO dto, String[] nan, MultipartFile[] fileNames);
	public void genDelete(GenBoardDTO dto);
}
