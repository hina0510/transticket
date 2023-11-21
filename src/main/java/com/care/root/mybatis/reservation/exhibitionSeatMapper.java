package com.care.root.mybatis.reservation;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.reservation.dto.exhibitionSeatDTO;

public interface exhibitionSeatMapper {
	public int eSeatSave(exhibitionSeatDTO cdto);
	public List<exhibitionSeatDTO> eGetSeat(@RequestParam String ex_buyer);
}
