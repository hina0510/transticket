package com.care.root.transboard.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.mybatis.reservation.concertSeatMapper;
import com.care.root.mybatis.transboard.TransBoardMapper;
import com.care.root.transboard.dto.TransBoardDTO;
import com.care.root.transboard.dto.TransLikeDTO;

@Service
public class TransBoardServiceImpl implements TransBoardService{
	@Autowired TransBoardMapper mapper;
	@Autowired concertSeatMapper csmapper;
	
	public Map<String, Object> transboardAllList(int num) {
		int pageLetter = 3; 
		int allCount = mapper.selectBoardCount();
		int repeat = allCount / pageLetter; 
		if(allCount % pageLetter != 0) { 
			repeat++; 
		}
		
		int end = num * pageLetter;
		int start = end +1 - pageLetter;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("repeat", repeat);
		map.put("list", mapper.boardAllList(start, end));
		
		return map;
	}
	
	public void transWriteSave(TransBoardDTO dto, String conS_id) {
		int result = mapper.transWriteSave(dto);
		if (result==1) {
			csmapper.seatWriteUpdate(conS_id);
		}
	}
	
	public TransBoardDTO transView(int writeNo) {
		upViewCount(writeNo);
		return mapper.transView(writeNo);
	}
	
	public void transModifySave(TransBoardDTO dto) {
		mapper.transModifySave(dto);
	}
	
	private void upViewCount(int writeNo) {
		mapper.upViewCount(writeNo);
	}
	
	public void transDelete(int writeNo) {
		mapper.transDelete(writeNo);
	}
	
	public void transLike(String id, int writeNo) {
		TransLikeDTO ld = new TransLikeDTO();
		ld.setId(id);
		ld.setWriteNo(writeNo);
		mapper.transLikeUpdate(writeNo);
		mapper.transLikeInsert(ld);
	}
	
	public String transLikeChk(String id, int writeNo) {
		String likesId;
		TransLikeDTO ldto = new TransLikeDTO();
		ldto.setId(id);
		ldto.setWriteNo(writeNo);
		
		System.out.println(ldto.getId());
		System.out.println(ldto.getWriteNo());
		
		String s = mapper.transLikeChk(ldto);
		if(s == null) {
			likesId = "none";
		}else {
			likesId = s;
		}
		System.out.println(likesId);
		
		return likesId;
	}
	public Map<String, Object> selectSearch(Model model, String type, String keyword, int num)throws Exception{
		int pageLetter = 5;
		int allCount = mapper.selectSearchCount(type,keyword);
		int repeat = allCount / pageLetter;
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
        
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("repeat", repeat);
		map.put("list", mapper.selectSearch(type,keyword, start, end));
		
		return map;
	}
}
