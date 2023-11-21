package com.care.root.reservation.service;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.reservation.dto.concertBoardDTO;
import com.care.root.reservation.dto.concertSeatDTO;
import com.care.root.reservation.dto.exhibitionBoardDTO;
import com.care.root.reservation.dto.exhibitionSeatDTO;
import com.care.root.reservation.dto.musicalBoardDTO;
import com.care.root.reservation.dto.musicalSeatDTO;

public interface reservationFileService {
	public String IMAGE_REPO="C:\\spring\\image_repo"; // C:/spring/image_repo
	public String getMessage(String msg, String url);
	public void cSaveImage(concertBoardDTO cdto, MultipartFile[] file, String[] nan);
	public void cModify(concertBoardDTO cdto, String[] nan,  MultipartFile[] fileNames);
	public void cDelete(concertBoardDTO cdto);
	public void cSeatSave(concertSeatDTO cdto);
	
	public void mSaveImage(musicalBoardDTO mdto, MultipartFile[] file, String[] nan);
	public void mModify(musicalBoardDTO mdto, String[] nan,  MultipartFile[] fileNames);
	public void mDelete(musicalBoardDTO mdto);
	public void mSeatSave(musicalSeatDTO mdto);
	
	public void eSaveImage(exhibitionBoardDTO edto, MultipartFile[] file, String[] nan);
	public void eModify(exhibitionBoardDTO edto, String[] nan,  MultipartFile[] fileNames);
	public void eDelete(exhibitionBoardDTO edto);
	public void eSeatSave(exhibitionSeatDTO edto);
}
