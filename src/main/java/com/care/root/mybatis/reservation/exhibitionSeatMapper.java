package com.care.root.mybatis.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.reservation.dto.exhibitionSeatDTO;

public interface exhibitionSeatMapper {
	public int eSeatSave(exhibitionSeatDTO cdto);
	public List<exhibitionSeatDTO> eGetSeat(@RequestParam String ex_buyer);
	public void eBuySeat(@Param("ex_title") String ex_title, @Param("ex_buyer") String ex_buyer);
	public void eDelSeat(@Param("ex_title") String ex_title, @Param("ex_buyer") String ex_buyer);
}
