package com.care.root.mybatis.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.care.root.reservation.dto.payDTO;

public interface paySeatMapper {
	public payDTO selectAccount(String account);
	public int saveAccount(@Param("money") int money, @Param("account") String account);
	public payDTO getAccount(String name);
}
