package com.care.root.reservation;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
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
import com.care.root.reservation.dto.exhibitionSeatDTO;
import com.care.root.reservation.dto.musicalBoardDTO;
import com.care.root.reservation.dto.musicalSeatDTO;
import com.care.root.reservation.dto.concertSeatDTO;
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
		model.addAttribute("dto", rs.cGetContent(writeNo));
		return "reservation/concert/concert_content";
	}
	@GetMapping("write_concert_form")
	public String wConcertForm() {
		return "reservation/concert/write_concert_form";
	}
	@PostMapping("write_concert_save")
	public String writeConcertSave(MultipartHttpServletRequest mt, concertBoardDTO cdto){
		String pri = mt.getParameter("price");
		int price = Integer.parseInt(pri);
		
		cdto.setTitle(mt.getParameter("title"));
		cdto.setType(mt.getParameter("type"));
		cdto.setComname(mt.getParameter("comname"));
		StringBuilder stDate = new StringBuilder(mt.getParameter("startDate"));
		stDate = stDate.deleteCharAt(11);
		stDate = stDate.deleteCharAt(12);
		stDate = stDate.deleteCharAt(13);
		String startDate = stDate.toString();
		startDate = startDate.replace(" ", "");
		StringBuilder eDate = new StringBuilder(mt.getParameter("endDate"));
		eDate = eDate.deleteCharAt(11);
		eDate = eDate.deleteCharAt(12);
		eDate = eDate.deleteCharAt(13);
		String endDate = eDate.toString();
		endDate = endDate.replace(" ", "");
		cdto.setCon_stDate(startDate);
		cdto.setCon_endDate(endDate);
		cdto.setCon_place(mt.getParameter("con_place"));
		cdto.setPrice(price);
		cdto.setContent(mt.getParameter("content"));
		cdto.setForm(mt.getParameter("form"));
		
		MultipartFile[] files = {mt.getFile("imgN1"),mt.getFile("imgN2"),mt.getFile("imgN3"),mt.getFile("imgN4"),mt.getFile("imgN5")};
        
        String[] nan = {mt.getParameter("image1"), mt.getParameter("image2"),
				mt.getParameter("image3"), mt.getParameter("image4"), mt.getParameter("image5")};
		
		fs.cSaveImage(cdto, files, nan);
		
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
		model.addAttribute("cdto", rs.cGetContent(writeNo));
		return "reservation/concert/modify_concert_form";
	}
	@PostMapping("modify_concert")//수정
	public String cModify(@RequestParam int writeNo, MultipartHttpServletRequest mt){
		System.out.println("게시글 번호 : " + writeNo);
		
		String pri = mt.getParameter("price");
		int price = Integer.parseInt(pri);
		
		concertBoardDTO cdto = rs.cGetContent(writeNo);
		cdto.setTitle(mt.getParameter("title"));
		cdto.setType(mt.getParameter("type"));
		cdto.setComname(mt.getParameter("comname"));
		cdto.setCon_stDate(mt.getParameter("startDate"));
		cdto.setCon_endDate(mt.getParameter("endDate"));
		cdto.setCon_place(mt.getParameter("con_place"));
		cdto.setPrice(price);
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
	public String concertForm1(@RequestParam int writeNo, Model model) {
		model.addAttribute("dto", rs.cGetContent(writeNo));
		return "reservation/concert/concert_form01";
	}
	@GetMapping("concert_form2")
	public String concertForm2(@RequestParam int writeNo, Model model) {
		model.addAttribute("dto", rs.cGetContent(writeNo));
		return "reservation/concert/concert_form02";
	}
	@GetMapping("concert_form3")
	public String concertForm3(@RequestParam int writeNo, Model model) {
		model.addAttribute("dto", rs.cGetContent(writeNo));
		return "reservation/concert/concert_form03";
	}
	@GetMapping("concert_calendar")
	public String concertCalendar() {
		return "reservation/concert/concert_calendar";
	}
	@PostMapping("cSeatCheck")
	public String cSeatCheck(MultipartHttpServletRequest mt, concertSeatDTO cdto) {
		cdto.setCon_title(mt.getParameter("title"));
		cdto.setCon_date(mt.getParameter("startDate"));
		cdto.setCon_place(mt.getParameter("con_place"));
		String cnt = mt.getParameter("count");
		int count = Integer.parseInt(cnt);
		String pri = mt.getParameter("price");
		int price = Integer.parseInt(pri);
		
		cdto.setConS_num(count);
		cdto.setConS_price(price);
		/*
		sdto.setConS_id(CLOGIN);
		sdto.setConSr_id(CLOGIN);
		sdto.setConS_pwd(CLOGIN);
		*/
		String seatArr = mt.getParameter("seatList");
		List<String> seatList = new ArrayList<>();
		for (int i=0; i<count; i++) {
			String seat = seatArr.substring(0, 4);
			String seatId = mt.getParameter("title")+"_"+mt.getParameter("startDate")+"_"+seat;
			if(i==0) {
				cdto.setConS_id01(seatId);
			}else if(i==1) {
				cdto.setConS_id02(seatId);
			}else if(i==2) {
				cdto.setConS_id03(seatId);
			}else if(i==3) {
				cdto.setConS_id04(seatId);
			}else if(i==4) {
				cdto.setConS_id05(seatId);
			}
			seatList.add(seat);
			seatArr=seatArr.substring(4);
		}
		cdto.setSeatList(seatList);
		System.out.println(cdto.getSeatList());
		
		return "redirect:concert_Payment";
	}
	@GetMapping("concert_Payment")
	public String concertPayment(concertSeatDTO cdto, Model model) {
		System.out.println(cdto.getCon_title());
		System.out.println(cdto.getConS_id01());
		System.out.println(cdto.getConS_id02());
		System.out.println(cdto.getConS_id03());
		System.out.println(cdto.getConS_id04());
		System.out.println(cdto.getConS_id05());
		return "reservation/concert/concert_Payment";
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
		model.addAttribute("dto", rs.mGetContent(writeNo));
		return "reservation/musical/musical_content";
	}
	@GetMapping("write_musical_form")
	public String wMusicalForm() {
		return "reservation/musical/write_musical_form";
	}
	@PostMapping("write_musical_save")
	public String writeMusicalSave(MultipartHttpServletRequest mt, musicalBoardDTO mdto){
		String pri = mt.getParameter("price");
		int price = Integer.parseInt(pri);
		
		mdto.setTitle(mt.getParameter("title"));
		mdto.setType(mt.getParameter("type"));
		mdto.setComname(mt.getParameter("comname"));
		StringBuilder stDate = new StringBuilder(mt.getParameter("startDate"));
		stDate = stDate.deleteCharAt(11);
		stDate = stDate.deleteCharAt(12);
		stDate = stDate.deleteCharAt(13);
		String startDate = stDate.toString();
		startDate = startDate.replace(" ", "");
		StringBuilder eDate = new StringBuilder(mt.getParameter("endDate"));
		eDate = eDate.deleteCharAt(11);
		eDate = eDate.deleteCharAt(12);
		eDate = eDate.deleteCharAt(13);
		String endDate = eDate.toString();
		endDate = endDate.replace(" ", "");
		mdto.setMu_stDate(startDate);
		mdto.setMu_endDate(endDate);
		mdto.setMu_place(mt.getParameter("mu_place"));
		mdto.setPrice(price);
		mdto.setContent(mt.getParameter("content"));
		mdto.setForm(mt.getParameter("form"));
		
		MultipartFile[] files = {mt.getFile("imgN1"),mt.getFile("imgN2"),mt.getFile("imgN3"),mt.getFile("imgN4"),mt.getFile("imgN5")};
        
        String[] nan = {mt.getParameter("image1"), mt.getParameter("image2"),
				mt.getParameter("image3"), mt.getParameter("image4"), mt.getParameter("image5")};
		
		fs.mSaveImage(mdto, files, nan);
		
		return "redirect:musical_board";
	}
	@GetMapping("modify_musical_form")
	public String mMusicalForm(@RequestParam int writeNo, Model model) {
		model.addAttribute("mdto", rs.mGetContent(writeNo));
		return "reservation/musical/modify_musical_form";
	}
	@PostMapping("modify_musical")//수정
	public String mModify(@RequestParam int writeNo, MultipartHttpServletRequest mt){
		System.out.println("게시글 번호 : " + writeNo);
		
		String pri = mt.getParameter("price");
		int price = Integer.parseInt(pri);
		
		musicalBoardDTO mdto = rs.mGetContent(writeNo);
		mdto.setTitle(mt.getParameter("title"));
		mdto.setType(mt.getParameter("type"));
		mdto.setComname(mt.getParameter("comname"));
		mdto.setMu_stDate(mt.getParameter("startDate"));
		mdto.setMu_endDate(mt.getParameter("endDate"));
		mdto.setMu_place(mt.getParameter("mu_place"));
		mdto.setPrice(price);
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
	public String musicalForm1(@RequestParam int writeNo, Model model) {
		model.addAttribute("dto", rs.mGetContent(writeNo));
		return "reservation/musical/musical_form01";
	}
	@GetMapping("musical_form2")
	public String musicalForm2(@RequestParam int writeNo, Model model) {
		model.addAttribute("dto", rs.mGetContent(writeNo));
		return "reservation/musical/musical_form02";
	}
	@GetMapping("musical_form3")
	public String musicalForm3(@RequestParam int writeNo, Model model) {
		model.addAttribute("dto", rs.mGetContent(writeNo));
		return "reservation/musical/musical_form03";
	}
	@GetMapping("musical_calendar")
	public String musicalCalendar() {
		return "reservation/musical/musical_calendar";
	}
	@PostMapping("mSeatCheck")
	public String mSeatCheck(MultipartHttpServletRequest mt, musicalSeatDTO mdto) {
		mdto.setMu_title(mt.getParameter("title"));
		mdto.setMu_date(mt.getParameter("startDate"));
		mdto.setMu_place(mt.getParameter("Mu_place"));
		String cnt = mt.getParameter("count");
		int count = Integer.parseInt(cnt);
		String pri = mt.getParameter("price");
		int price = Integer.parseInt(pri);
		
		mdto.setMuS_num(count);
		mdto.setMuS_price(price);
		/*
		sdto.setConS_id(CLOGIN);
		sdto.setConSr_id(CLOGIN);
		sdto.setConS_pwd(CLOGIN);
		*/
		String seatArr = mt.getParameter("seatList");
		List<String> seatList = new ArrayList<>();
		for (int i=0; i<count; i++) {
			String seat = seatArr.substring(0, 4);
			String seatId = mt.getParameter("title")+"_"+mt.getParameter("startDate")+"_"+seat;
			if(i==0) {
				mdto.setMuS_id01(seatId);
			}else if(i==1) {
				mdto.setMuS_id02(seatId);
			}else if(i==2) {
				mdto.setMuS_id03(seatId);
			}else if(i==3) {
				mdto.setMuS_id04(seatId);
			}else if(i==4) {
				mdto.setMuS_id05(seatId);
			}
			seatList.add(seat);
			seatArr=seatArr.substring(4);
		}
		mdto.setSeatList(seatList);
		System.out.println(mdto.getSeatList());
		
		return "redirect:musical_Payment";
	}
	@GetMapping("musical_Payment")
	public String musicalPayment(musicalSeatDTO mdto, Model model) {
		System.out.println(mdto.getMu_title());
		System.out.println(mdto.getMuS_id01());
		System.out.println(mdto.getMuS_id02());
		System.out.println(mdto.getMuS_id03());
		System.out.println(mdto.getMuS_id04());
		System.out.println(mdto.getMuS_id05());
		return "reservation/musical/musical_Payment";
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
		model.addAttribute("dto", rs.eGetContent(writeNo));
		return "reservation/exhibition/exhibition_content";
	}
	@GetMapping("write_exhibition_form")
	public String wExhibitionForm() {
		return "reservation/exhibition/write_exhibition_form";
	}
	@PostMapping("write_exhibition_save")
	public String writeExhibitionSave(MultipartHttpServletRequest mt, exhibitionBoardDTO edto){
		String pri = mt.getParameter("price");
		int price = Integer.parseInt(pri);
		
		edto.setTitle(mt.getParameter("title"));
		edto.setType(mt.getParameter("type"));
		edto.setComname(mt.getParameter("comname"));
		StringBuilder stDate = new StringBuilder(mt.getParameter("startDate"));
		stDate = stDate.deleteCharAt(11);
		stDate = stDate.deleteCharAt(12);
		stDate = stDate.deleteCharAt(13);
		String startDate = stDate.toString();
		startDate = startDate.replace(" ", "");
		StringBuilder eDate = new StringBuilder(mt.getParameter("endDate"));
		eDate = eDate.deleteCharAt(11);
		eDate = eDate.deleteCharAt(12);
		eDate = eDate.deleteCharAt(13);
		String endDate = eDate.toString();
		endDate = endDate.replace(" ", "");
		edto.setEx_stDate(startDate);
		edto.setEx_endDate(endDate);
		edto.setEx_place(mt.getParameter("ex_place"));
		edto.setPrice(price);
		edto.setContent(mt.getParameter("content"));
		edto.setForm(mt.getParameter("form"));

		MultipartFile[] files = {mt.getFile("imgN1"),mt.getFile("imgN2"),mt.getFile("imgN3"),mt.getFile("imgN4"),mt.getFile("imgN5")};
        
        String[] nan = {mt.getParameter("image1"), mt.getParameter("image2"),
				mt.getParameter("image3"), mt.getParameter("image4"), mt.getParameter("image5")};
		
		fs.eSaveImage(edto, files, nan);
		
		return "redirect:exhibition_board";
	}
	@GetMapping("modify_exhibition_form")
	public String mExhibitionForm(@RequestParam int writeNo, Model model) {
		model.addAttribute("edto", rs.eGetContent(writeNo));
		return "reservation/exhibition/modify_exhibition_form";
	}
	@PostMapping("modify_exhibition")//수정
	public String eModify(@RequestParam int writeNo, MultipartHttpServletRequest mt){
		System.out.println("게시글 번호 : " + writeNo);
		
		String pri = mt.getParameter("price");
		int price = Integer.parseInt(pri);
		
		exhibitionBoardDTO edto = rs.eGetContent(writeNo);
		edto.setTitle(mt.getParameter("title"));
		edto.setType(mt.getParameter("type"));
		edto.setComname(mt.getParameter("comname"));
		edto.setEx_stDate(mt.getParameter("startDate"));
		edto.setEx_endDate(mt.getParameter("endDate"));
		edto.setEx_place(mt.getParameter("ex_place"));
		edto.setPrice(price);
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
	
	@GetMapping("exhibition_form1")
	public String exhibitionForm1(@RequestParam int writeNo, Model model) {
		model.addAttribute("dto", rs.eGetContent(writeNo));
		return "reservation/exhibition/exhibition_form01";
	}
	@GetMapping("exhibition_calendar")
	public String exhibitionCalendar() {
		return "reservation/exhibition/exhibition_calendar";
	}
	@PostMapping("eSeatCheck")
	public String eSeatCheck(MultipartHttpServletRequest mt, exhibitionSeatDTO edto) {
		edto.setEx_title(mt.getParameter("title"));
		edto.setEx_date(mt.getParameter("startDate"));
		edto.setEx_place(mt.getParameter("con_place"));
		String cnt = mt.getParameter("count");
		int count = Integer.parseInt(cnt);
		String pri = mt.getParameter("price");
		int price = Integer.parseInt(pri);
		
		edto.setExS_num(count);
		edto.setExS_price(price);
		/*
		sdto.setConS_id(CLOGIN);
		sdto.setConSr_id(CLOGIN);
		sdto.setConS_pwd(CLOGIN);
		*/
		String seatArr = mt.getParameter("seatList");
		List<String> seatList = new ArrayList<>();
		for (int i=0; i<count; i++) {
			String seat = seatArr.substring(0, 4);
			String seatId = mt.getParameter("title")+"_"+mt.getParameter("startDate")+"_"+seat;
			if(i==0) {
				edto.setExS_id01(seatId);
			}else if(i==1) {
				edto.setExS_id02(seatId);
			}else if(i==2) {
				edto.setExS_id03(seatId);
			}else if(i==3) {
				edto.setExS_id04(seatId);
			}else if(i==4) {
				edto.setExS_id05(seatId);
			}
			seatList.add(seat);
			seatArr=seatArr.substring(4);
		}
		edto.setSeatList(seatList);
		System.out.println(edto.getSeatList());
		
		return "redirect:exhibition_Payment";
	}
	@GetMapping("exhibition_Payment")
	public String exhibitionPayment(exhibitionSeatDTO edto, Model model) {
		System.out.println(edto.getEx_title());
		System.out.println(edto.getExS_id01());
		System.out.println(edto.getExS_id02());
		System.out.println(edto.getExS_id03());
		System.out.println(edto.getExS_id04());
		System.out.println(edto.getExS_id05());
		return "reservation/exhibition/exhibition_Payment";
	}
}
