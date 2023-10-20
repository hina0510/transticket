package com.care.root.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("reservation")
public class reservationController {
	
	@GetMapping("concert_board")
	public String concertBoard() {
		return "reservation/concert_board";
	}
	@GetMapping("concert_content")
	public String concertContent() {
		return "reservation/concert_content";
	}
	@GetMapping("write_concert_form")
	public String wConcertForm() {
		return "reservation/write_concert_form";
	}
	@GetMapping("modify_concert_form")
	public String mConcertForm() {
		return "reservation/modify_concert_form";
	}
	
	@GetMapping("concert_form01")
	public String concertForm01() {
		return "reservation/concert_form01";
	}
	@GetMapping("concert_form02")
	public String concertForm02() {
		return "reservation/concert_form02";
	}
	@GetMapping("concert_form03")
	public String concertForm03() {
		return "reservation/concert_form03";
	}
}
