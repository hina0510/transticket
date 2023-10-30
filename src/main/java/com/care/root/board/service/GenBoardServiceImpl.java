package com.care.root.board.service;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.board.dto.GenBoardDTO;
import com.care.root.mybatis.board.GenBoardMapper;

@Service
public class GenBoardServiceImpl implements GenBoardService{
	@Autowired GenBoardMapper mapper;
	
	public Map<String, Object> boardAllList(int num) {
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
	
	
	public GenBoardDTO genView(int writeNo) {
		return mapper.genView(writeNo);
	}
	
	public void genDelete(int writeNo) {
		mapper.genDelete(writeNo);
	}
}

