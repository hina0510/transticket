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
		return "reservation/concert/concert_board";
	}
	@GetMapping("concert_content")
	public String concertContent() {
		return "reservation/concert/concert_content";
	}
	@GetMapping("write_concert_form")
	public String wConcertForm() {
		return "reservation/concert/write_concert_form";
	}
	@GetMapping("modify_concert_form")
	public String mConcertForm() {
		return "reservation/concert/modify_concert_form";
	}
	
	@GetMapping("concert_form01")
	public String concertForm01() {
		return "reservation/concert/concert_form01";
	}
	@GetMapping("concert_form02")
	public String concertForm02() {
		return "reservation/concert/concert_form02";
	}
	@GetMapping("concert_form03")
	public String concertForm03() {
		return "reservation/concert/concert_form03";
	}
	
	@GetMapping("musical_board")
	public String musicalBoard() {
		return "reservation/musical/musical_board";
	}
	@GetMapping("musical_content")
	public String musicalContent() {
		return "reservation/musical/musical_content";
	}
	@GetMapping("write_musical_form")
	public String wMusicalForm() {
		return "reservation/musical/write_musical_form";
	}
	@GetMapping("modify_musical_form")
	public String mMusicalForm() {
		return "reservation/musical/modify_musical_form";
	}
	
	@GetMapping("musical_form01")
	public String musicalForm01() {
		return "reservation/musical/musical_form01";
	}
	@GetMapping("musical_form02")
	public String musicalForm02() {
		return "reservation/musical/musical_form02";
	}
	@GetMapping("musical_form03")
	public String musicalForm03() {
		return "reservation/musical/musical_form03";
	}
	
	@GetMapping("exhibition_board")
	public String exhibitionBoard() {
		return "reservation/exhibition/exhibition_board";
	}
	@GetMapping("exhibition_content")
	public String exhibitionContent() {
		return "reservation/exhibition/exhibition_content";
	}
	@GetMapping("write_exhibition_form")
	public String wExhibitionForm() {
		return "reservation/exhibition/write_exhibition_form";
	}
	@GetMapping("modify_exhibition_form")
	public String mExhibitionForm() {
		return "reservation/exhibition/modify_exhibition_form";
	}
	@GetMapping("exhibition_form01")
	public String exhibitionForm01() {
		return "reservation/exhibition/exhibition_form01";
	}
}
