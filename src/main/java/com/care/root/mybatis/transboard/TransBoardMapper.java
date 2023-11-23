package com.care.root.mybatis.transboard;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.care.root.transboard.dto.TransBoardDTO;
import com.care.root.transboard.dto.TransLikeDTO;

public interface TransBoardMapper {
	public int selectBoardCount();
	public List<TransBoardDTO> boardAllList(@Param("s") int start, @Param("e") int end);
	public void transWriteSave(TransBoardDTO dto);
	public TransBoardDTO transView(int writeNo);
	public void transModifySave(TransBoardDTO dto);
	public void upViewCount(int writeNo);
	public void transDelete(int writeNo);
	public void transLikeUpdate(int writeNo);
	public void transLikeInsert(TransLikeDTO ld);
	public String transLikeChk(TransLikeDTO ld);
	public ArrayList<TransBoardDTO> selectSearch(@Param("type")String type,@Param("keyword")String keyword,@Param("s") int start, @Param("e") int end)throws Exception;
	public int selectSearchCount(@Param("type")String type,@Param("keyword")String keyword);
}
