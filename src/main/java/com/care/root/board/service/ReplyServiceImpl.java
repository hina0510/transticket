package com.care.root.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.board.dto.ReplyDTO;
import com.care.root.mybatis.board.GenBoardMapper;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired GenBoardMapper mapper;
	
	public void addReply(ReplyDTO dto) {
		System.out.println("dksdsddd : " + dto.getcId());
		System.out.println("dksdsddd : " + dto.getnId());
		System.out.println("dksdsddd : " + dto.getContent());
		System.out.println("dksdsddd : " + dto.getWriteNo());
		if(dto.getcId().equals("nan") && dto.getnId().equals("nan")) {
			
		}else {
			mapper.addReply(dto);
		}
		
	}
	
	public List<ReplyDTO> viewRep(int writeNo) {
		return mapper.viewRep(writeNo);
	}
	
	public void replyDelete(int replyNo) {
		mapper.replyDelete(replyNo);
	}
	
	public void replyModify(ReplyDTO dto) {
		mapper.replyModify(dto);
	}
}
