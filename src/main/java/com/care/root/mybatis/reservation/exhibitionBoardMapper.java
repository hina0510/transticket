package com.care.root.mybatis.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.care.root.reservation.dto.rLikeDTO;
import com.care.root.reservation.dto.exhibitionBoardDTO;

public interface exhibitionBoardMapper {
	public List<exhibitionBoardDTO> eBoardList(@Param("s") int start, @Param("e") int end);
	public exhibitionBoardDTO eGetContent(int writeNo);
	public void eUpHit(int writeNo);
	public int eWriteSave(exhibitionBoardDTO mdto);
	public int eModify(exhibitionBoardDTO dto);
	public int eDelete(int writeNo);
	public int selectEBoardCount();
	public void eLikeUpdate(int writeNo);
	public void eLikeInsert(rLikeDTO rdto);
	public String eLikeChk(rLikeDTO rdto);
}
