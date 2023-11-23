package com.care.root.mybatis.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.reservation.dto.concertSeatDTO;

public interface concertSeatMapper {
	public int cSeatSave(concertSeatDTO cdto);
	public List<concertSeatDTO> cGetSeat(@RequestParam String con_buyer);
	public void cBuySeat(@Param("con_title") String con_title, @Param("con_buyer") String con_buyer);
	
	public List<concertSeatDTO> reservationAllList(String con_buyer);
	public List<concertSeatDTO> selectTicket(String conS_id);
	public void presentTicket(@Param("con_buyer") String con_buyer, @Param("conS_id") String conS_id);
}
