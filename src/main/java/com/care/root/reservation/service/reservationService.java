package com.care.root.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.reservation.dto.concertBoardDTO;
import com.care.root.reservation.dto.concertSeatDTO;
import com.care.root.reservation.dto.exhibitionBoardDTO;
import com.care.root.reservation.dto.exhibitionSeatDTO;
import com.care.root.reservation.dto.musicalBoardDTO;
import com.care.root.reservation.dto.musicalSeatDTO;

public interface reservationService {
	public Map<String, Object> cBoardList(int num);
	public concertBoardDTO cGetContent(int writeNo);
	public void cUpHit(int writeNo);
	public String cDelete(int writeNo);
	public void cLike(String id, int writeNo);
	public String cLikeChk(String id, int writeNo);
	
	public List<concertSeatDTO> cGetSeat(@RequestParam String con_buyer);
	public int BuySeat(String account, int price);
	public void cBuySeat(String con_title, String con_buyer);
	
	public Map<String, Object> mBoardList(int num);
	public musicalBoardDTO mGetContent(int writeNo);
	public void mUpHit(int writeNo);
	public String mDelete(int writeNo);
	public void mLike(String id, int writeNo);
	public String mLikeChk(String id, int writeNo);
	
	public List<musicalSeatDTO> mGetSeat(@RequestParam String mu_buyer);
	public void mBuySeat(String mu_title, String mu_buyer);
	
	public Map<String, Object> eBoardList(int num);
	public exhibitionBoardDTO eGetContent(int writeNo);
	public void eUpHit(int writeNo);
	public String eDelete(int writeNo);
	public void eLike(String id, int writeNo);
	public String eLikeChk(String id, int writeNo);
	
	public List<exhibitionSeatDTO> eGetSeat(@RequestParam String ex_buyer);
	public void eBuySeat(String ex_title, String ex_buyer);
	
	public List<concertSeatDTO> reservationAllList(String con_buyer);
	public List<concertSeatDTO> selectTicket(String conS_id);
	public void presentTicket(String con_buyer, String conS_id);
}
