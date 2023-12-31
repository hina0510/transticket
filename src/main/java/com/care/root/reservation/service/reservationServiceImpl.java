package com.care.root.reservation.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.mybatis.reservation.concertBoardMapper;
import com.care.root.mybatis.reservation.concertSeatMapper;
import com.care.root.mybatis.reservation.exhibitionBoardMapper;
import com.care.root.mybatis.reservation.exhibitionSeatMapper;
import com.care.root.mybatis.reservation.musicalBoardMapper;
import com.care.root.mybatis.reservation.musicalSeatMapper;
import com.care.root.mybatis.reservation.paySeatMapper;
import com.care.root.mybatis.transboard.TransBoardMapper;
import com.care.root.reservation.dto.rLikeDTO;
import com.care.root.reservation.dto.concertBoardDTO;
import com.care.root.reservation.dto.concertSeatDTO;
import com.care.root.reservation.dto.exhibitionBoardDTO;
import com.care.root.reservation.dto.exhibitionSeatDTO;
import com.care.root.reservation.dto.musicalBoardDTO;
import com.care.root.reservation.dto.musicalSeatDTO;
import com.care.root.reservation.dto.payDTO;

@Service
public class reservationServiceImpl implements reservationService{
	@Autowired concertBoardMapper cmapper;
	@Autowired concertSeatMapper csmapper;
	@Autowired musicalBoardMapper mmapper;
	@Autowired musicalSeatMapper msmapper;
	@Autowired exhibitionBoardMapper emapper;
	@Autowired exhibitionSeatMapper esmapper;
	@Autowired TransBoardMapper tmapper;
	@Autowired paySeatMapper pmapper;
	@Autowired reservationFileService fs;
	
	public Map<String, Object> cBoardList(int num){
		int pageLetter = 9; //글 총 개수
		int allCount = cmapper.selectCBoardCount(); //글 총 개수
		int repeat = allCount/pageLetter; //총 페이지 수
		if(allCount%pageLetter !=0) {//나머지 페이지가 있으면
			repeat++;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("repeat", repeat);
		map.put("list", cmapper.cBoardList(start, end));

		return map;
	}
	public concertBoardDTO cGetContent(int writeNo) {
		return cmapper.cGetContent(writeNo);
	}
	public void cUpHit(int writeNo) {
		cmapper.cUpHit(writeNo);
	}
	public String cDelete(int writeNo) {
		int result = cmapper.cDelete(writeNo);
		String msg = "", url="";
		if(result==1) {
			msg="삭제되었습니다";
			url="/root/reservation/concert_board";
		}else {
			msg="문제 발생";
			url="/root/reservation/concert_content?writeNo="+writeNo;
		}
		return fs.getMessage(msg, url);
	}
	public void cLike(String id, int writeNo) {
		rLikeDTO rdto = new rLikeDTO();
		rdto.setId(id);
		rdto.setWriteNo(writeNo);
		cmapper.cLikeUpdate(writeNo);
		cmapper.cLikeInsert(rdto);
	}
	public String cLikeChk(String id, int writeNo) {
		String likesId;
		rLikeDTO rdto = new rLikeDTO();
		rdto.setId(id);
		rdto.setWriteNo(writeNo);
		
		System.out.println(rdto.getId());
		System.out.println(rdto.getWriteNo());
		
		String s = cmapper.cLikeChk(rdto);
		if(s == null) {
			likesId = "none";
		}else {
			likesId = s;
		}
		System.out.println(likesId);
		
		return likesId;
	}
	public List<concertSeatDTO> cGetSeat(@RequestParam String con_buyer) {
		return csmapper.cGetSeat(con_buyer);
	}
	public void cBuySeat(String account, int price, String con_title, String con_buyer){
		payDTO pdto = pmapper.selectAccount(account);
		int money = pdto.getMoney();
		System.out.println("금액 : "+money);
		if(money>=price) {
			money = money-price;
			System.out.println("계산 후 금액 : "+money);
			pdto.setMoney(money);
			System.out.println("계산 후 금액 : "+pdto.getMoney());
			pmapper.saveAccount(money, account);
			csmapper.cBuySeat(con_title, con_buyer);
		}
		else {
			csmapper.cDelSeat(con_title, con_buyer);
		}
	}
	public void concert_CardBuySeat(@RequestParam String con_title, @RequestParam String con_buyer){
		csmapper.cBuySeat(con_title, con_buyer);
	}
	
	public Map<String, Object> mBoardList(int num){
		int pageLetter = 9; //몇 개 글
		int allCount = mmapper.selectMBoardCount(); //글 총 개수
		int repeat = allCount/pageLetter; //총 페이지 수
		if(allCount%pageLetter !=0) {//나머지 페이지가 있으면
			repeat++;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("repeat", repeat);
		map.put("list", mmapper.mBoardList(start, end));
		
		return map;
	}
	public musicalBoardDTO mGetContent(int writeNo) {
		return mmapper.mGetContent(writeNo);
	}
	public void mUpHit(int writeNo) {
		mmapper.mUpHit(writeNo);
	}
	public String mDelete(int writeNo) {
		int result = mmapper.mDelete(writeNo);
		String msg = "", url="";
		if(result==1) {
			msg="삭제되었습니다";
			url="/root/reservation/musical_board";
		}else {
			msg="문제 발생";
			url="/root/reservation/musical_content?writeNo="+writeNo;
		}
		return fs.getMessage(msg, url);
	}
	public void mLike(String id, int writeNo) {
		rLikeDTO rdto = new rLikeDTO();
		rdto.setId(id);
		rdto.setWriteNo(writeNo);
		mmapper.mLikeUpdate(writeNo);
		mmapper.mLikeInsert(rdto);
	}
	public String mLikeChk(String id, int writeNo) {
		String likesId;
		rLikeDTO rdto = new rLikeDTO();
		rdto.setId(id);
		rdto.setWriteNo(writeNo);
		
		System.out.println(rdto.getId());
		System.out.println(rdto.getWriteNo());
		
		String s = mmapper.mLikeChk(rdto);
		if(s == null) {
			likesId = "none";
		}else {
			likesId = s;
		}
		System.out.println(likesId);
		
		return likesId;
	}
	public List<musicalSeatDTO> mGetSeat(@RequestParam String mu_buyer){
		return msmapper.mGetSeat(mu_buyer);
	}
	public void mBuySeat(String account, int price, String mu_title, String mu_buyer){
		payDTO pdto = pmapper.selectAccount(account);
		int money = pdto.getMoney();
		System.out.println("금액 : "+money);
		if(money>=price) {
			money = money-price;
			System.out.println("계산 후 금액 : "+money);
			pdto.setMoney(money);
			System.out.println("계산 후 금액 : "+pdto.getMoney());
			pmapper.saveAccount(money, account);
			msmapper.mBuySeat(mu_title, mu_buyer);
		}
		else {
			msmapper.mDelSeat(mu_title, mu_buyer);
		}
	}
	public void musical_CardBuySeat(@RequestParam String mu_title, @RequestParam String mu_buyer) {
		msmapper.mBuySeat(mu_title, mu_buyer);
	}
	
	public Map<String, Object> eBoardList(int num){
		int pageLetter = 9; //글 총 개수
		int allCount = emapper.selectEBoardCount(); //글 총 개수
		int repeat = allCount/pageLetter; //총 페이지 수
		if(allCount%pageLetter !=0) {//나머지 페이지가 있으면
			repeat++;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("repeat", repeat);
		map.put("list", emapper.eBoardList(start, end));
		
		return map;
	}
	public exhibitionBoardDTO eGetContent(int writeNo) {
		return emapper.eGetContent(writeNo);
	}
	public void eUpHit(int writeNo) {
		emapper.eUpHit(writeNo);
	}
	public String eDelete(int writeNo) {
		int result = emapper.eDelete(writeNo);
		String msg = "", url="";
		if(result==1) {
			msg="삭제되었습니다";
			url="/root/reservation/exhibition_board";
		}else {
			msg="문제 발생";
			url="/root/reservation/exhibition_content?writeNo="+writeNo;
		}
		return fs.getMessage(msg, url);
	}
	public void eLike(String id, int writeNo) {
		rLikeDTO rdto = new rLikeDTO();
		rdto.setId(id);
		rdto.setWriteNo(writeNo);
		emapper.eLikeUpdate(writeNo);
		emapper.eLikeInsert(rdto);
	}
	public String eLikeChk(String id, int writeNo) {
		String likesId;
		rLikeDTO rdto = new rLikeDTO();
		rdto.setId(id);
		rdto.setWriteNo(writeNo);
		
		System.out.println(rdto.getId());
		System.out.println(rdto.getWriteNo());
		
		String s = emapper.eLikeChk(rdto);
		if(s == null) {
			likesId = "none";
		}else {
			likesId = s;
		}
		System.out.println(likesId);
		
		return likesId;
	}
	public List<exhibitionSeatDTO> eGetSeat(@RequestParam String ex_buyer){
		return esmapper.eGetSeat(ex_buyer);
	}
	public void eBuySeat(String account, int price, String ex_title, String ex_buyer){
		payDTO pdto = pmapper.selectAccount(account);
		int money = pdto.getMoney();
		System.out.println("금액 : "+money);
		if(money>=price) {
			money = money-price;
			System.out.println("계산 후 금액 : "+money);
			pdto.setMoney(money);
			System.out.println("계산 후 금액 : "+pdto.getMoney());
			pmapper.saveAccount(money, account);
			esmapper.eBuySeat(ex_title, ex_buyer);
		}
		else {
			esmapper.eDelSeat(ex_title, ex_buyer);
		}
	}
	public void exhibition_CardBuySeat(@RequestParam String ex_title, @RequestParam String ex_buyer) {
		esmapper.eBuySeat(ex_title, ex_buyer);
	}
	
	public List<concertSeatDTO> reservationAllList(String con_buyer){
		return csmapper.reservationAllList(con_buyer);
	}
	public List<concertSeatDTO> selectTicket(String conS_id){
		return csmapper.selectTicket(conS_id);
	}
	public void presentTicket(String con_buyer, String conS_id) {
		csmapper.presentTicket(con_buyer, conS_id);
	}
	public payDTO getAccount(String name){
		return pmapper.getAccount(name);
	}
	public void BuySeat(String sAccount, String bAccount, int price, String conS_id, String con_buyer, int writeNo){
		payDTO pdto = pmapper.selectAccount(bAccount);
		int money = pdto.getMoney();
		System.out.println("금액 : "+money);
		if(money>=price) {
			money = money-price;
			System.out.println("계산 후 금액 : "+money);
			pdto.setMoney(money);
			System.out.println("계산 후 금액 : "+pdto.getMoney());
			pmapper.saveAccount(money, bAccount);
			sellSeat(sAccount, price);
			csmapper.presentTicket(con_buyer, conS_id);
			csmapper.seatWriteDown(conS_id);
			tmapper.transDelete(writeNo);
		}
		else {
			String msg = "", url="";
			msg="거래 불가";
			url="/root/transboard/transBoardList";
			fs.getMessage(msg, url);
		}
	}
	public void sellSeat(String account, int price) {
		payDTO pdto = pmapper.selectAccount(account);
		int money = pdto.getMoney();
		money = money+price;
		System.out.println("계산 후 금액 : "+money);
		pdto.setMoney(money);
		System.out.println("계산 후 금액 : "+pdto.getMoney());
		pmapper.saveAccount(money, account);
	}
	public void cancelTicket(String con_buyer, String conS_id, int price) {
		csmapper.cancelTicket(conS_id);
		payDTO pdto = pmapper.getAccount(con_buyer);
		int money = pdto.getMoney();
		price-=2000;
		money = money+price;
		pdto.setMoney(money);
		pmapper.saveMoney(money, con_buyer);
		tmapper.transDel(conS_id);
	}
}