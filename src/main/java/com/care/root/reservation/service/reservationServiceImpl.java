package com.care.root.reservation.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.mybatis.reservation.concertBoardMapper;
import com.care.root.mybatis.reservation.exhibitionBoardMapper;
import com.care.root.mybatis.reservation.musicalBoardMapper;
import com.care.root.reservation.dto.concertBoardDTO;
import com.care.root.reservation.dto.exhibitionBoardDTO;
import com.care.root.reservation.dto.musicalBoardDTO;

@Service
public class reservationServiceImpl implements reservationService{
	@Autowired concertBoardMapper cmapper;
	@Autowired musicalBoardMapper mmapper;
	@Autowired exhibitionBoardMapper emapper;
	@Autowired reservationFileService fs;
	
	public Map<String, Object> cBoardList(int num){
		int pageLetter = 9; //�� �� ��
		int allCount = cmapper.selectCBoardCount(); //�� �� ����
		int repeat = allCount/pageLetter; //�� ������ ��
		if(allCount%pageLetter !=0) {//������ �������� ������
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
			msg="�����Ǿ����ϴ�";
			url="/root/reservation/concert_board";
		}else {
			msg="���� �߻�";
			url="/root/reservation/concert_content?writeNo="+writeNo;
		}
		return fs.getMessage(msg, url);
	}
	
	public Map<String, Object> mBoardList(int num){
		int pageLetter = 9; //�� �� ��
		int allCount = mmapper.selectMBoardCount(); //�� �� ����
		int repeat = allCount/pageLetter; //�� ������ ��
		if(allCount%pageLetter !=0) {//������ �������� ������
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
			msg="�����Ǿ����ϴ�";
			url="/root/reservation/musical_board";
		}else {
			msg="���� �߻�";
			url="/root/reservation/musical_content?writeNo="+writeNo;
		}
		return fs.getMessage(msg, url);
	}
	
	public Map<String, Object> eBoardList(int num){
		int pageLetter = 9; //�� �� ��
		int allCount = emapper.selectEBoardCount(); //�� �� ����
		int repeat = allCount/pageLetter; //�� ������ ��
		if(allCount%pageLetter !=0) {//������ �������� ������
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
			msg="�����Ǿ����ϴ�";
			url="/root/reservation/exhibition_board";
		}else {
			msg="���� �߻�";
			url="/root/reservation/exhibition_content?writeNo="+writeNo;
		}
		return fs.getMessage(msg, url);
	}
}
