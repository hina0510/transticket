package com.care.root.mybatis.reservation;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.reservation.dto.concertSeatDTO;

public interface concertSeatMapper {
	public int cSeatSave(concertSeatDTO cdto);
	public List<concertSeatDTO> cGetSeat(@RequestParam String con_buyer);
}
