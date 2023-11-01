package com.care.root.mybatis.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.care.root.board.dto.GenBoardDTO;

@Repository
public interface GenBoardMapper {
	public int selectBoardCount();
	public List<GenBoardDTO> boardAllList(@Param("s") int start, @Param("e") int end);
	public void saveWrite(GenBoardDTO dto);
	public GenBoardDTO genView(int writeNo);
	public void upViewCount(int writeNo);
	public void modify(GenBoardDTO dto);
	public void genDelete(int writeNo);
	
}
