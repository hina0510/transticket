package com.care.root.mybatis.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.care.root.reservation.dto.musicalBoardDTO;

public interface musicalBoardMapper {
	public List<musicalBoardDTO> mBoardList(@Param("s") int start, @Param("e") int end);
	public musicalBoardDTO mGetContent(int writeNo);
	public void mUpHit(int writeNo);
	public int mWriteSave(musicalBoardDTO mdto);
	public int mModify(musicalBoardDTO dto);
	public int mDelete(int writeNo);
	public int selectMBoardCount();
}
