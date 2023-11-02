package com.care.root.reservation;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.common.LoginSession;
import com.care.root.reservation.dto.concertBoardDTO;
import com.care.root.reservation.dto.exhibitionBoardDTO;
import com.care.root.reservation.dto.musicalBoardDTO;
import com.care.root.reservation.service.reservationFileService;
import com.care.root.reservation.service.reservationService;

@Controller
@RequestMapping("reservation")
public class reservationController implements LoginSession{
	@Autowired reservationService  rs;
	@Autowired reservationFileService  fs;
	
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
		rs.cUpHit(writeNo);
		model.addAttribute("cdto", rs.cGetContent(writeNo));
		return "reservation/concert/concert_content";
	}
	@GetMapping("write_concert_form")
	public String wConcertForm() {
		return "reservation/concert/write_concert_form";
	}
	@PostMapping("write_concert_save")
	public String writeConcertSave(MultipartHttpServletRequest mt, concertBoardDTO cdto,
			@RequestParam("file_name") MultipartFile[] files, HttpServletResponse res) throws IOException {
		
		cdto.setTitle(mt.getParameter("title"));
		cdto.setType(mt.getParameter("type"));
		cdto.setComname(mt.getParameter("comname"));
		cdto.setCon_stDate(mt.getParameter("startDate"));
		cdto.setCon_endDate(mt.getParameter("endDate"));
		cdto.setCon_place(mt.getParameter("con_place"));
		cdto.setContent(mt.getParameter("content"));
		cdto.setForm(mt.getParameter("form"));
		fs.cSaveImage(cdto, files);
		
		return "redirect:concert_board";
	}
	@GetMapping("download")
	public void download(@RequestParam String file, HttpServletResponse response) throws Exception {
		String encodedName = URLEncoder.encode(file, "UTF-8");
		response.addHeader("Content-disposition", "attachment; fileName="+encodedName);
		File files = new File(reservationFileService.IMAGE_REPO + "/" + file);
		FileInputStream in = new FileInputStream(files);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	@GetMapping("modify_concert_form")
	public String mConcertForm(@RequestParam int writeNo, Model model) {
		model.addAttribute("content", rs.cGetContent(writeNo));
		return "reservation/concert/modify_concert_form";
	}
	@PostMapping("modify_concert")
	public String cModify(@RequestParam int writeNo, MultipartHttpServletRequest mt){
		System.out.println("게시글 번호 : " + writeNo);
		
		concertBoardDTO cdto = rs.cGetContent(writeNo);
		cdto.setTitle(mt.getParameter("title"));
		cdto.setType(mt.getParameter("type"));
		cdto.setComname(mt.getParameter("comname"));
		cdto.setCon_stDate(mt.getParameter("startDate"));
		cdto.setCon_endDate(mt.getParameter("endDate"));
		cdto.setCon_place(mt.getParameter("con_place"));
		cdto.setContent(mt.getParameter("content"));
		cdto.setForm(mt.getParameter("form"));
		
		// 여기부터 삭제를 눌러서 nan을 저장한 것
		String[] nan = {mt.getParameter("image1"), mt.getParameter("image2"),
						mt.getParameter("image3"), mt.getParameter("image4"), mt.getParameter("image5")};
		// 여기는 새로운 이미지파일을 넣은 것
		MultipartFile[] fileNames = {
			mt.getFile("imageName1"),
			mt.getFile("imageName2"),
			mt.getFile("imageName3"),
			mt.getFile("imageName4"),
			mt.getFile("imageName5")
		};
		
		fs.cModify(cdto, nan, fileNames);
		return "redirect:concert_content?writeNo="+writeNo;
	}
	@GetMapping("delete_concert")
	public String cDelete(@RequestParam int writeNo, concertBoardDTO cdto){
		cdto = rs.cGetContent(writeNo);
		fs.cDelete(cdto);
		rs.cDelete(writeNo);
		return "redirect:concert_board";
	}
	
	@GetMapping("concert_form1")
	public String concertForm1() {
		return "reservation/concert/concert_form01";
	}
	@GetMapping("concert_form2")
	public String concertForm2() {
		return "reservation/concert/concert_form02";
	}
	@GetMapping("concert_form3")
	public String concertForm3() {
		return "reservation/concert/concert_form03";
	}
	@GetMapping("concert_calendar")
	public String concertCalendar() {
		return "reservation/concert/concert_calendar";
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
		rs.mUpHit(writeNo);
		model.addAttribute("mdto", rs.mGetContent(writeNo));
		return "reservation/musical/musical_content";
	}
	@GetMapping("write_musical_form")
	public String wMusicalForm() {
		return "reservation/musical/write_musical_form";
	}
	@PostMapping("write_musical_save")
	public String writeMusicalSave(MultipartHttpServletRequest mt, musicalBoardDTO mdto,
			@RequestParam("file_name") MultipartFile[] files, HttpServletResponse res) throws IOException {
		
		mdto.setTitle(mt.getParameter("title"));
		mdto.setType(mt.getParameter("type"));
		mdto.setComname(mt.getParameter("comname"));
		mdto.setMu_stDate(mt.getParameter("startDate"));
		mdto.setMu_endDate(mt.getParameter("endDate"));
		mdto.setMu_place(mt.getParameter("mu_place"));
		mdto.setContent(mt.getParameter("content"));
		mdto.setForm(mt.getParameter("form"));
		fs.mSaveImage(mdto, files);
		
		return "redirect:musical_board";
	}
	@GetMapping("modify_musical_form")
	public String mMusicalForm(@RequestParam int writeNo, Model model) {
		model.addAttribute("content", rs.mGetContent(writeNo));
		return "reservation/musical/modify_musical_form";
	}
	@PostMapping("modify_musical")
	public String mModify(@RequestParam int writeNo, MultipartHttpServletRequest mt){
		System.out.println("게시글 번호 : " + writeNo);
		
		musicalBoardDTO mdto = rs.mGetContent(writeNo);
		mdto.setTitle(mt.getParameter("title"));
		mdto.setType(mt.getParameter("type"));
		mdto.setComname(mt.getParameter("comname"));
		mdto.setMu_stDate(mt.getParameter("startDate"));
		mdto.setMu_endDate(mt.getParameter("endDate"));
		mdto.setMu_place(mt.getParameter("mu_place"));
		mdto.setContent(mt.getParameter("content"));
		mdto.setForm(mt.getParameter("form"));
		
		// 여기부터 삭제를 눌러서 nan을 저장한 것
		String[] nan = {mt.getParameter("image1"), mt.getParameter("image2"),
						mt.getParameter("image3"), mt.getParameter("image4"), mt.getParameter("image5")};
		// 여기는 새로운 이미지파일을 넣은 것
		MultipartFile[] fileNames = {
			mt.getFile("imageName1"),
			mt.getFile("imageName2"),
			mt.getFile("imageName3"),
			mt.getFile("imageName4"),
			mt.getFile("imageName5")
		};
		
		fs.mModify(mdto, nan, fileNames);
		return "redirect:musical_content?writeNo="+writeNo;
	}
	@GetMapping("delete_musical")
	public String mDelete(@RequestParam int writeNo, musicalBoardDTO mdto){
		mdto = rs.mGetContent(writeNo);
		fs.mDelete(mdto);
		rs.mDelete(writeNo);
		return "redirect:musical_board";
	}
	
	@GetMapping("musical_form1")
	public String musicalForm1() {
		return "reservation/musical/musical_form01";
	}
	@GetMapping("musical_form2")
	public String musicalForm2() {
		return "reservation/musical/musical_form02";
	}
	@GetMapping("musical_form3")
	public String musicalForm3() {
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
		rs.eUpHit(writeNo);
		model.addAttribute("edto", rs.eGetContent(writeNo));
		return "reservation/exhibition/exhibition_content";
	}
	@GetMapping("write_exhibition_form")
	public String wExhibitionForm() {
		return "reservation/exhibition/write_exhibition_form";
	}
	@PostMapping("write_exhibition_save")
	public String writeExhibitionSave(MultipartHttpServletRequest mt, exhibitionBoardDTO edto,
			@RequestParam("file_name") MultipartFile[] files, HttpServletResponse res) throws IOException {
		
		edto.setTitle(mt.getParameter("title"));
		edto.setType(mt.getParameter("type"));
		edto.setComname(mt.getParameter("comname"));
		edto.setEx_stDate(mt.getParameter("startDate"));
		edto.setEx_endDate(mt.getParameter("endDate"));
		edto.setEx_place(mt.getParameter("ex_place"));
		edto.setContent(mt.getParameter("content"));
		edto.setForm(mt.getParameter("form"));
		fs.eSaveImage(edto, files);
		
		return "redirect:exhibition_board";
	}
	@GetMapping("modify_exhibition_form")
	public String mExhibitionForm(@RequestParam int writeNo, Model model) {
		model.addAttribute("content", rs.eGetContent(writeNo));
		return "reservation/exhibition/modify_exhibition_form";
	}
	@PostMapping("modify_exhibition")
	public String eModify(@RequestParam int writeNo, MultipartHttpServletRequest mt){
		System.out.println("게시글 번호 : " + writeNo);
		
		exhibitionBoardDTO edto = rs.eGetContent(writeNo);
		edto.setTitle(mt.getParameter("title"));
		edto.setType(mt.getParameter("type"));
		edto.setComname(mt.getParameter("comname"));
		edto.setEx_stDate(mt.getParameter("startDate"));
		edto.setEx_endDate(mt.getParameter("endDate"));
		edto.setEx_place(mt.getParameter("ex_place"));
		edto.setContent(mt.getParameter("content"));
		edto.setForm(mt.getParameter("form"));
		
		// 여기부터 삭제를 눌러서 nan을 저장한 것
		String[] nan = {mt.getParameter("image1"), mt.getParameter("image2"),
						mt.getParameter("image3"), mt.getParameter("image4"), mt.getParameter("image5")};
		// 여기는 새로운 이미지파일을 넣은 것
		MultipartFile[] fileNames = {
			mt.getFile("imageName1"),
			mt.getFile("imageName2"),
			mt.getFile("imageName3"),
			mt.getFile("imageName4"),
			mt.getFile("imageName5")
		};
		
		fs.eModify(edto, nan, fileNames);
		return "redirect:exhibition_content?writeNo="+writeNo;
	}
	@GetMapping("delete_exhibition")
	public String eDelete(@RequestParam int writeNo, exhibitionBoardDTO edto){
		edto = rs.eGetContent(writeNo);
		fs.eDelete(edto);
		rs.eDelete(writeNo);
		return "redirect:exhibition_board";
	}
	
	@GetMapping("exhibition_form01")
	public String exhibitionForm01() {
		return "reservation/exhibition/exhibition_form01";
	}
}
