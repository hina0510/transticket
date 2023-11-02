package com.care.root.reservation.service;

import java.util.Map;

import com.care.root.reservation.dto.concertBoardDTO;
import com.care.root.reservation.dto.exhibitionBoardDTO;
import com.care.root.reservation.dto.musicalBoardDTO;

public interface reservationService {
	public Map<String, Object> cBoardList(int num);
	public concertBoardDTO cGetContent(int writeNo);
	public void cUpHit(int writeNo);
	public String cDelete(int writeNo);
	
	public Map<String, Object> mBoardList(int num);
	public musicalBoardDTO mGetContent(int writeNo);
	public void mUpHit(int writeNo);
	public String mDelete(int writeNo);
	
	public Map<String, Object> eBoardList(int num);
	public exhibitionBoardDTO eGetContent(int writeNo);
	public void eUpHit(int writeNo);
	public String eDelete(int writeNo);
}
