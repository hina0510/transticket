package com.care.root.reservation.service;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.reservation.dto.concertBoardDTO;
import com.care.root.reservation.dto.exhibitionBoardDTO;
import com.care.root.reservation.dto.musicalBoardDTO;

public interface reservationFileService {
	public String IMAGE_REPO="C:\\spring\\image_repo"; // C:/spring/image_repo
	public String getMessage(String msg, String url);
	public void cSaveImage(concertBoardDTO cdto, MultipartFile[] file);
	public void cModify(concertBoardDTO cdto, String[] nan,  MultipartFile[] fileNames);
	public void cDelete(concertBoardDTO cdto);
	
	public void mSaveImage(musicalBoardDTO mdto, MultipartFile[] file);
	public void mModify(musicalBoardDTO mdto, String[] nan,  MultipartFile[] fileNames);
	public void mDelete(musicalBoardDTO mdto);
	
	public void eSaveImage(exhibitionBoardDTO edto, MultipartFile[] file);
	public void eModify(exhibitionBoardDTO edto, String[] nan,  MultipartFile[] fileNames);
	public void eDelete(exhibitionBoardDTO edto);
}
