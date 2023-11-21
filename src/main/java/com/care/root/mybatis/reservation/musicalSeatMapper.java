package com.care.root.mybatis.reservation;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.reservation.dto.musicalSeatDTO;

public interface musicalSeatMapper {
	public int mSeatSave(musicalSeatDTO cdto);
	public List<musicalSeatDTO> mGetSeat(@RequestParam String mu_buyer);
}
