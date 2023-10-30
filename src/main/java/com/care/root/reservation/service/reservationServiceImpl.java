package com.care.root.reservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	public String cWriteSave(concertBoardDTO cdto, MultipartFile file) {
		cdto.setImage_file_name(fs.saveFile(file));
		
		int result = cmapper.cWriteSave(cdto);
		String msg = "", url="";
		if(result==1) {//DB에 성공적으로 저장
			msg="새 글이 추가되었습니다";
			url="/root/board/boardAllList";
		}else {//DB에 저장 실패
			msg="문제가 발생했습니다";
			url="/root/board/writeForm";
		}
		return fs.getMessage(msg, url);
	}
	public String mWriteSave(musicalBoardDTO mdto, MultipartFile file) {
		mdto.setImage_file_name(fs.saveFile(file));
		
		int result = mmapper.mWriteSave(mdto);
		String msg = "", url="";
		if(result==1) {//DB에 성공적으로 저장
			msg="새 글이 추가되었습니다";
			url="/root/board/boardAllList";
		}else {//DB에 저장 실패
			msg="문제가 발생했습니다";
			url="/root/board/writeForm";
		}
		return fs.getMessage(msg, url);
	}
	public String eWriteSave(exhibitionBoardDTO edto, MultipartFile file){
		edto.setImage_file_name(fs.saveFile(file));
		
		int result = emapper.eWriteSave(edto);
		String msg = "", url="";
		if(result==1) {//DB에 성공적으로 저장
			msg="새 글이 추가되었습니다";
			url="/root/board/boardAllList";
		}else {//DB에 저장 실패
			msg="문제가 발생했습니다";
			url="/root/board/writeForm";
		}
		return fs.getMessage(msg, url);
	}
}
