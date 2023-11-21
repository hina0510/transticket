package com.care.root.board.service;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.board.dto.GenBoardDTO;
import com.care.root.board.dto.LikeDTO;
import com.care.root.mybatis.board.GenBoardMapper;

@Service
public class GenBoardServiceImpl implements GenBoardService{
	@Autowired GenBoardMapper mapper;
	
	public Map<String, Object> boardAllList(int num) {
		int pageLetter =5; 
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
	
	
	public GenBoardDTO genView(int writeNo) {
		upViewCount(writeNo);
		return mapper.genView(writeNo);
	}
	
	private void upViewCount(int writeNo) {
		mapper.upViewCount(writeNo);
	}
	
	public void genDelete(int writeNo) {
		mapper.genDelete(writeNo);
	}
	
	public void genLike(String id, int writeNo) {
		LikeDTO ld = new LikeDTO();
		ld.setId(id);
		ld.setWriteNo(writeNo);
		mapper.genLikeUpdate(writeNo);
		mapper.genLikeInsert(ld);
	}
	
	
	public String genLikeChk(String id, int writeNo) {
		String likesId;
		LikeDTO ldto = new LikeDTO();
		ldto.setId(id);
		ldto.setWriteNo(writeNo);
		
		System.out.println(ldto.getId());
		System.out.println(ldto.getWriteNo());
		
		String s = mapper.genLikeChk(ldto);
		if(s == null) {
			likesId = "none";
		}else {
			likesId = s;
		}
		System.out.println(likesId);
		
	return likesId;
	}
}

