package com.care.root.transboard.service;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.care.root.transboard.dto.TransBoardDTO;

public interface TransBoardService {
	public Map<String, Object> transboardAllList(int num);
	public void transWriteSave(TransBoardDTO dto, String conS_id);
	public TransBoardDTO transView(int writeNo);
	public void transModifySave(TransBoardDTO dto);
	public void transDelete(int writeNo);
	public void transLike(String id, int writeNo);
	public String transLikeChk(String id, int writeNo);
	public Map<String, Object> selectSearch(@Param("type")Model model, @Param("type")String type, @Param("keyword")String keyword, int num)throws Exception;
	public void seatWriteDown(String conS_id);
}
