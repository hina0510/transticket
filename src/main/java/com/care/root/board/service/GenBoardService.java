package com.care.root.board.service;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.care.root.board.dto.GenBoardDTO;

public interface GenBoardService {
	public String IMAGE_REPO="C:\\spring\\image_repo"; // C:/spring/image_repo
	public  Map<String, Object> boardAllList(int num);
	public GenBoardDTO genView(int writeNo);
	public void genDelete(int writeNo);
	public void genLike(String id, int writeNo);
	public String genLikeChk(String id, int writeNo);
	public Map<String, Object> selectSearch(@Param("type")Model model, @Param("type")String type, @Param("keyword")String keyword, int num)throws Exception;
}
