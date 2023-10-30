package com.care.root.reservation.service;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.reservation.dto.concertBoardDTO;
import com.care.root.reservation.dto.exhibitionBoardDTO;
import com.care.root.reservation.dto.musicalBoardDTO;

public interface reservationService {
	public String cWriteSave(concertBoardDTO cdto, MultipartFile file);
	public String mWriteSave(musicalBoardDTO mdto, MultipartFile file);
	public String eWriteSave(exhibitionBoardDTO edto, MultipartFile file);
}
