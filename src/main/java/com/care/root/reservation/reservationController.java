package com.care.root.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String concertBoard(Model model, @RequestParam(required = false, defaultValue = "1") int num) {
		Map<String, Object> map = rs.cBoardList(num);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("repeat", map.get("repeat"));
		
		return "reservation/concert/concert_board";
	}
	@GetMapping("concert_content")
	public String concertContent(@RequestParam int writeNo, Model model) {
		model.addAttribute("dto", rs.cContentView(writeNo));
		return "reservation/concert/concert_content";
	}
	@GetMapping("write_concert_form")
	public String wConcertForm() {
		return "reservation/concert/write_concert_form";
	}
	@PostMapping("write_concert_save")
	public void writeConcertSave(concertBoardDTO cdto, @RequestParam(required = false) MultipartFile file_name,
			HttpServletResponse res) throws IOException {
		System.out.println(cdto.getTitle());
		System.out.println(cdto.getContent());
		System.out.println(file_name.getOriginalFilename());
		System.out.println(cdto.getForm());
		
		String msg=rs.cWriteSave(cdto, file_name);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(msg);
	}
	@GetMapping("modify_concert_form")
	public String mConcertForm(@RequestParam int writeNo, Model model) {
		model.addAttribute("content", rs.cGetContent(writeNo));
		return "reservation/concert/modify_concert_form";
	}
	@PostMapping("modify_concert")
	public void cModify(concertBoardDTO cdto, @RequestParam MultipartFile file, HttpServletResponse res) throws Exception {
		String msg = rs.cModify(cdto, file);
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(msg);
	}
	@GetMapping("delete_concert")
	public void cDelete(@RequestParam int writeNo, @RequestParam String fileName, HttpServletResponse res)throws Exception {
		String msg = rs.cDelete(writeNo, fileName);
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(msg);
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
	public String musicalBoard(Model model, @RequestParam(required = false, defaultValue = "1") int num) {
		Map<String, Object> map = rs.mBoardList(num);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("repeat", map.get("repeat"));
		return "reservation/musical/musical_board";
	}
	@GetMapping("musical_content")
	public String musicalContent(@RequestParam int writeNo, Model model) {
		model.addAttribute("dto", rs.mContentView(writeNo));
		return "reservation/musical/musical_content";
	}
	@GetMapping("write_musical_form")
	public String wMusicalForm() {
		return "reservation/musical/write_musical_form";
	}
	@PostMapping("write_musical_save")
	public void writeMusicalSave(musicalBoardDTO mdto, @RequestParam(required = false) MultipartFile file_name,
			HttpServletResponse res) throws IOException {
		System.out.println(mdto.getTitle());
		System.out.println(mdto.getContent());
		System.out.println(file_name.getOriginalFilename());
		System.out.println(mdto.getForm());
		
		String msg=rs.mWriteSave(mdto, file_name);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(msg);
	}
	@GetMapping("modify_musical_form")
	public String mMusicalForm(@RequestParam int writeNo, Model model) {
		model.addAttribute("content", rs.mGetContent(writeNo));
		return "reservation/musical/modify_musical_form";
	}
	@PostMapping("modify_musical")
	public void mModify(musicalBoardDTO mdto, @RequestParam MultipartFile file, HttpServletResponse res) throws Exception {
		String msg = rs.mModify(mdto, file);
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(msg);
	}
	@GetMapping("delete_musical")
	public void mDelete(@RequestParam int writeNo, @RequestParam String fileName, HttpServletResponse res)throws Exception {
		String msg = rs.mDelete(writeNo, fileName);
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(msg);
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
	public String exhibitionBoard(Model model, @RequestParam(required = false, defaultValue = "1") int num) {
		Map<String, Object> map = rs.eBoardList(num);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("repeat", map.get("repeat"));
		return "reservation/exhibition/exhibition_board";
	}
	@GetMapping("exhibition_content")
	public String exhibitionContent(@RequestParam int writeNo, Model model) {
		model.addAttribute("dto", rs.eContentView(writeNo));
		return "reservation/exhibition/exhibition_content";
	}
	@GetMapping("write_exhibition_form")
	public String wExhibitionForm() {
		return "reservation/exhibition/write_exhibition_form";
	}
	@PostMapping("write_exhibition_save")
	public void writeExhibitionSave(exhibitionBoardDTO edto, @RequestParam(required = false) MultipartFile file_name,
			HttpServletResponse res) throws IOException {
		System.out.println(edto.getTitle());
		System.out.println(edto.getContent());
		System.out.println(file_name.getOriginalFilename());
		System.out.println(edto.getForm());
		
		String msg=rs.eWriteSave(edto, file_name);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(msg);
	}
	@GetMapping("modify_exhibition_form")
	public String mExhibitionForm(@RequestParam int writeNo, Model model) {
		model.addAttribute("content", rs.eGetContent(writeNo));
		return "reservation/exhibition/modify_exhibition_form";
	}
	@PostMapping("modify_exhibition")
	public void eModify(exhibitionBoardDTO edto, @RequestParam MultipartFile file, HttpServletResponse res) throws Exception {
		String msg = rs.eModify(edto, file);
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(msg);
	}
	@GetMapping("delete_exhibition")
	public void eDelete(@RequestParam int writeNo, @RequestParam String fileName, HttpServletResponse res)throws Exception {
		String msg = rs.eDelete(writeNo, fileName);
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(msg);
	}
	
	@GetMapping("exhibition_form01")
	public String exhibitionForm01() {
		return "reservation/exhibition/exhibition_form01";
	}
}
