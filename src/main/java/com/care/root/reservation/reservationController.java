package com.care.root.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.care.root.reservation.dto.concertBoardDTO;
import com.care.root.reservation.dto.exhibitionBoardDTO;
import com.care.root.reservation.dto.musicalBoardDTO;
import com.care.root.reservation.service.reservationService;

@Controller
@RequestMapping("reservation")
public class reservationController {
	@Autowired(required=false) reservationService  rs;
	
	//콘서트
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
	@PostMapping("write_concert_save")
	public String writeConcertSave(concertBoardDTO cdto, @RequestParam(required = false) MultipartFile file_name) {
		System.out.println(cdto.getTitle());
		System.out.println(cdto.getContent());
		System.out.println(file_name.getOriginalFilename());
		System.out.println(cdto.getForm());
		
		rs.cWriteSave(cdto, file_name);
		
		return "redirect:concert_board";
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
	
	//뮤지컬
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
	@PostMapping("write_musical_save")
	public String writeMusicalSave(musicalBoardDTO mdto, @RequestParam(required = false) MultipartFile file_name) {
		System.out.println(mdto.getTitle());
		System.out.println(mdto.getContent());
		System.out.println(file_name.getOriginalFilename());
		System.out.println(mdto.getForm());
		
		rs.mWriteSave(mdto, file_name);
		
		return "redirect:musical_board";
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
	
	//전시
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
	@PostMapping("write_exhibition_save")
	public String writeExhibitionSave(exhibitionBoardDTO edto, @RequestParam(required = false) MultipartFile file_name) {
		System.out.println(edto.getTitle());
		System.out.println(edto.getContent());
		System.out.println(file_name.getOriginalFilename());
		System.out.println(edto.getForm());
		
		rs.eWriteSave(edto, file_name);
		
		return "redirect:exhibition_board";
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
