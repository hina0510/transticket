package com.care.root.mybatis.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.care.root.board.dto.GenBoardDTO;
import com.care.root.board.dto.LikeDTO;

@Repository
public interface GenBoardMapper {
	public int selectBoardCount();
	public List<GenBoardDTO> boardAllList(@Param("s") int start, @Param("e") int end);
	public void saveWrite(GenBoardDTO dto);
	public GenBoardDTO genView(int writeNo);
	public void upViewCount(int writeNo);
	public void modify(GenBoardDTO dto);
	public void genDelete(int writeNo);
	public void genLikeUpdate(int writeNo);
	public void genLikeInsert(LikeDTO ld);
	public String genLikeChk(LikeDTO ld);
	
}
