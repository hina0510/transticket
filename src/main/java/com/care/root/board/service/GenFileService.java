package com.care.root.board.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.care.root.board.dto.GenBoardDTO;

public interface GenFileService {
	public String IMAGE_REPO = "c:/spring/images";
	public void saveImage(GenBoardDTO dto, MultipartFile[] files, String[] nan);
	public void modify(GenBoardDTO dto, String[] nan, MultipartFile[] fileNames);
	public void genDelete(GenBoardDTO dto);
	public void selectSearch(Model model, String type, String keyword, int num);
	public void boardList(Model model, int num);
}
