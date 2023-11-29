package com.care.root.mybatis.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.reservation.dto.musicalSeatDTO;

public interface musicalSeatMapper {
	public int mSeatSave(musicalSeatDTO cdto);
	public List<musicalSeatDTO> mGetSeat(@RequestParam String mu_buyer);
	public void mBuySeat(@Param("mu_title") String mu_title, @Param("mu_buyer") String mu_buyer);
	public void mDelSeat(@Param("mu_title") String mu_title, @Param("mu_buyer") String mu_buyer);
}
