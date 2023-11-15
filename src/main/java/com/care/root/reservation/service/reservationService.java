package com.care.root.reservation.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.reservation.dto.concertBoardDTO;
import com.care.root.reservation.dto.exhibitionBoardDTO;
import com.care.root.reservation.dto.musicalBoardDTO;

public interface reservationService {
	public Map<String, Object> cBoardList(int num);
	public concertBoardDTO cContentView(int writeNo);
	public String cWriteSave(concertBoardDTO cdto, MultipartFile file);
	public concertBoardDTO cGetContent(int writeNo);
	public String cModify(concertBoardDTO cdto, MultipartFile file);
	public String cDelete(int writeNo, String fileName);
	
	public Map<String, Object> mBoardList(int num);
	public musicalBoardDTO mContentView(int writeNo);
	public String mWriteSave(musicalBoardDTO mdto, MultipartFile file);
	public musicalBoardDTO mGetContent(int writeNo);
	public String mModify(musicalBoardDTO cdto, MultipartFile file);
	public String mDelete(int writeNo, String fileName);
	
	public Map<String, Object> eBoardList(int num);
	public exhibitionBoardDTO eContentView(int writeNo);
	public String eWriteSave(exhibitionBoardDTO edto, MultipartFile file);
	public exhibitionBoardDTO eGetContent(int writeNo);
	public String eModify(exhibitionBoardDTO cdto, MultipartFile file);
	public String eDelete(int writeNo, String fileName);
}
