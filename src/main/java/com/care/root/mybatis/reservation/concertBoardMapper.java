package com.care.root.mybatis.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.care.root.reservation.dto.concertBoardDTO;

public interface concertBoardMapper {
	public List<concertBoardDTO> cBoardList(@Param("s") int start, @Param("e") int end);
	public concertBoardDTO cGetContent(int writeNo);
	public void cUpHit(int writeNo);
	public int cWriteSave(concertBoardDTO cdto);
	public int cModify(concertBoardDTO dto);
	public int cDelete(int writeNo);
	public int selectCBoardCount();
}
