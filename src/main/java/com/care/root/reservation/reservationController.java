package com.care.root.reservation;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.care.root.genmember.service.GenMemberService;
import com.care.root.reservation.dto.concertBoardDTO;
import com.care.root.reservation.dto.exhibitionBoardDTO;
import com.care.root.reservation.dto.exhibitionSeatDTO;
import com.care.root.reservation.dto.musicalBoardDTO;
import com.care.root.reservation.dto.musicalSeatDTO;
import com.care.root.reservation.dto.payDTO;
import com.care.root.reservation.dto.concertSeatDTO;
import com.care.root.reservation.service.reservationFileService;
import com.care.root.reservation.service.reservationService;

@Controller
@RequestMapping("reservation")
public class reservationController implements LoginSession{
	@Autowired reservationService  rs;
	@Autowired reservationFileService  fs;
	@Autowired GenMemberService gms;
	
	@GetMapping("concert_board")
	public String concertBoard(Model model, @RequestParam(required = false, defaultValue = "1") int num) {
		Map<String, Object> map = rs.cBoardList(num);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("repeat", map.get("repeat"));
		
		return "reservation/concert/concert_board";
	}
	@GetMapping("concert_content")
	public String concertContent(@RequestParam int writeNo, Model model, HttpSession session) {
		rs.cUpHit(writeNo);
		
		String id;
		if(session.getAttribute(LoginSession.GLOGIN) == null) {
			id = "undefined";
		}else {
			id = (String) session.getAttribute(LoginSession.GLOGIN);
		}
		model.addAttribute("dto", rs.cGetContent(writeNo));
		model.addAttribute("genId", id);
		model.addAttribute("likes", rs.cLikeChk(id, writeNo));
		return "reservation/concert/concert_content";
	}
	@PostMapping("likes")
	public String likes(@RequestParam String id,
						@RequestParam int writeNo) {
		System.out.println(id + writeNo);
		rs.cLike(id, writeNo);
		return "redirect:concert_content?writeNo="+ writeNo;
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
	@PostMapping("modify_concert")
	public String cModify(@RequestParam int writeNo, MultipartHttpServletRequest mt){
		System.out.println("writeNo : " + writeNo);
		
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
		
		String[] nan = {mt.getParameter("image1"), mt.getParameter("image2"),
						mt.getParameter("image3"), mt.getParameter("image4"), mt.getParameter("image5")};
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
	public String cSeatCheck(MultipartHttpServletRequest mt, @RequestParam String con_title, @RequestParam String con_buyer, concertSeatDTO cdto) {
		cdto.setCon_title(mt.getParameter("con_title"));
		cdto.setCon_date(mt.getParameter("startDate"));
		cdto.setCon_place(mt.getParameter("con_place"));
		cdto.setCon_buyer(mt.getParameter("con_buyer"));
		String cnt = mt.getParameter("count");
		int count = Integer.parseInt(cnt);
		String pri = mt.getParameter("price");
		int price = Integer.parseInt(pri);//寃곗젣�븸
		int rprice = price/count;//�떚耳� 媛�寃�
		
		cdto.setConS_num(count);
		cdto.setConS_price(rprice);
		/*
		cdto.setConSr_id(CLOGIN);
		cdto.setConS_pwd(CLOGIN);
		*/
		String seatArr = mt.getParameter("seatList");
		List<String> seatList = new ArrayList<>();
		for (int i=0; i<count; i++) {
			String seat = seatArr.substring(0, 4);
			String seatId = mt.getParameter("con_title")+"_"+mt.getParameter("startDate")+"_"+seat;
			if(i==0) {
				seatList.add(seatId);
				cdto.setConS_id(seatId);
				fs.cSeatSave(cdto);
			}else if(i==1) {
				seatList.add(seatId);
				cdto.setConS_id(seatId);
				fs.cSeatSave(cdto);
			}else if(i==2) {
				seatList.add(seatId);
				cdto.setConS_id(seatId);
				fs.cSeatSave(cdto);
			}else if(i==3) {
				seatList.add(seatId);
				cdto.setConS_id(seatId);
				fs.cSeatSave(cdto);
			}else if(i==4) {
				seatList.add(seatId);
				cdto.setConS_id(seatId);
				fs.cSeatSave(cdto);
			}
			seatArr=seatArr.substring(4);
		}
		cdto.setSeatList(seatList);
		System.out.println(cdto.getSeatList());
		
		return "redirect:concert_Payment?con_title="+con_title+"&&con_buyer="+con_buyer+"&&price="+price;
	}
	@GetMapping("concert_Payment")
	public String concertPayment(@RequestParam String con_title, @RequestParam String con_buyer, @RequestParam int price, Model model) {
		model.addAttribute("title", con_title);
		model.addAttribute("buyer", con_buyer);
		model.addAttribute("price", price);
		
		//model.addAttribute("list", rs.cGetSeat(con_buyer));
		
		return "reservation/concert/concert_Payment";
	}
	@PostMapping("concert_BuySeat")
	public String concertBuySeat(HttpServletRequest req, payDTO pdto) {
		pdto.setAccount(req.getParameter("account"));
		String account= pdto.getAccount();
		pdto.setTitle(req.getParameter("title"));
		String title= pdto.getTitle();
		pdto.setName(req.getParameter("buyer"));
		String name= pdto.getName();
		String pri = req.getParameter("price");
		int price = Integer.parseInt(pri);
		pdto.setPrice(price);
		
		int result = rs.BuySeat(account, price);
		if(result==1) {
			rs.cBuySeat(title, name);
		}else {
			return "redirect:concert_board";
		}
		return "redirect:successPay";
	}
	@GetMapping("cSuccessPay")
	public String cSuccessPay() {
		return "reservation/concert/successPay";
	}
	
	
	//musical
	@GetMapping("musical_board")
	public String musicalBoard(Model model, @RequestParam(required = false, defaultValue = "1") int num) {
		Map<String, Object> map = rs.mBoardList(num);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("repeat", map.get("repeat"));
		
		return "reservation/musical/musical_board";
	}
	@GetMapping("musical_content")
	public String musicalContent(@RequestParam int writeNo, Model model, HttpSession session) {
		rs.mUpHit(writeNo);
		String id;
		if(session.getAttribute(LoginSession.GLOGIN) == null) {
			id = "undefined";
		}else {
			id = (String) session.getAttribute(LoginSession.GLOGIN);
		}
		model.addAttribute("dto", rs.mGetContent(writeNo));
		model.addAttribute("genId", id);
		model.addAttribute("likes", rs.mLikeChk(id, writeNo));
		
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
	@PostMapping("modify_musical")
	public String mModify(@RequestParam int writeNo, MultipartHttpServletRequest mt){
		System.out.println("野껊슣�뻻疫뀐옙 甕곕뜇�깈 : " + writeNo);
		
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
		
		String[] nan = {mt.getParameter("image1"), mt.getParameter("image2"),
						mt.getParameter("image3"), mt.getParameter("image4"), mt.getParameter("image5")};
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
	public String mSeatCheck(MultipartHttpServletRequest mt, @RequestParam String mu_title, @RequestParam String mu_buyer, musicalSeatDTO mdto) {
		mdto.setMu_title(mt.getParameter("mu_title"));
		mdto.setMu_date(mt.getParameter("startDate"));
		mdto.setMu_buyer(mt.getParameter("mu_buyer"));
		mdto.setMu_place(mt.getParameter("mu_place"));
		String cnt = mt.getParameter("count");
		int count = Integer.parseInt(cnt);
		String pri = mt.getParameter("price");
		int price = Integer.parseInt(pri);
		int rprice = price/count;
		
		mdto.setMuS_num(count);
		mdto.setMuS_price(rprice);
		/*
		sdto.setConSr_id(CLOGIN);
		sdto.setConS_pwd(CLOGIN);
		*/
		String seatArr = mt.getParameter("seatList");
		List<String> seatList = new ArrayList<>();
		for (int i=0; i<count; i++) {
			String seat = seatArr.substring(0, 4);
			String seatId = mt.getParameter("mu_title")+"_"+mt.getParameter("startDate")+"_"+seat;
			if(i==0) {
				seatList.add(seatId);
				mdto.setMuS_id(seatId);
				fs.mSeatSave(mdto);
			}else if(i==1) {
				seatList.add(seatId);
				mdto.setMuS_id(seatId);
				fs.mSeatSave(mdto);
			}else if(i==2) {
				seatList.add(seatId);
				mdto.setMuS_id(seatId);
				fs.mSeatSave(mdto);
			}else if(i==3) {
				seatList.add(seatId);
				mdto.setMuS_id(seatId);
				fs.mSeatSave(mdto);
			}else if(i==4) {
				seatList.add(seatId);
				mdto.setMuS_id(seatId);
				fs.mSeatSave(mdto);
			}
			seatList.add(seat);
			seatArr=seatArr.substring(4);
		}
		mdto.setSeatList(seatList);
		System.out.println(mdto.getSeatList());
		return "redirect:musical_Payment?mu_title="+mu_title+"&&mu_buyer="+mu_buyer+"&&price="+price;
	}
	@GetMapping("musical_Payment")
	public String musicalPayment(@RequestParam String mu_title, @RequestParam String mu_buyer, @RequestParam int price, Model model) {
		model.addAttribute("title", mu_title);
		model.addAttribute("buyer", mu_buyer);
		model.addAttribute("price", price);
		
		return "reservation/musical/musical_Payment";
	}
	@PostMapping("musical_BuySeat")
	public String musicalBuySeat(HttpServletRequest req, payDTO pdto) {
		pdto.setAccount(req.getParameter("account"));
		String account= pdto.getAccount();
		pdto.setTitle(req.getParameter("title"));
		String title= pdto.getTitle();
		pdto.setName(req.getParameter("buyer"));
		String name= pdto.getName();
		String pri = req.getParameter("price");
		int price = Integer.parseInt(pri);
		pdto.setPrice(price);
		
		int result = rs.BuySeat(account, price);
		if(result==1) {
			rs.mBuySeat(title, name);
		}else {
			return "redirect:musical_board";
		}
		return "redirect:mSuccessPay";
	}
	@GetMapping("mSuccessPay")
	public String mSuccessPay() {
		return "reservation/musical/successPay";
	}
	
	
	//exhibition
	@GetMapping("exhibition_board")
	public String exhibitionBoard(Model model, @RequestParam(required = false, defaultValue = "1") int num) {
		Map<String, Object> map = rs.eBoardList(num);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("repeat", map.get("repeat"));
		
		return "reservation/exhibition/exhibition_board";
	}
	@GetMapping("exhibition_content")
	public String exhibitionContent(@RequestParam int writeNo, Model model, HttpSession session) {
		rs.eUpHit(writeNo);
		String id;
		if(session.getAttribute(LoginSession.GLOGIN) == null) {
			id = "undefined";
		}else {
			id = (String) session.getAttribute(LoginSession.GLOGIN);
		}
		model.addAttribute("dto", rs.eGetContent(writeNo));
		model.addAttribute("genId", id);
		model.addAttribute("likes", rs.eLikeChk(id, writeNo));
		
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
	@PostMapping("modify_exhibition")
	public String eModify(@RequestParam int writeNo, MultipartHttpServletRequest mt){
		System.out.println("writeNo : " + writeNo);
		
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
		
		// 占쎈연疫꿸퀡占쏙옙苑� 占쎄텣占쎌젫�몴占� 占쎈땭占쎌쑎占쎄퐣 nan占쎌뱽 占쏙옙占쎌삢占쎈립 野껓옙
		String[] nan = {mt.getParameter("image1"), mt.getParameter("image2"),
						mt.getParameter("image3"), mt.getParameter("image4"), mt.getParameter("image5")};
		// 占쎈연疫꿸퀡�뮉 占쎄퉱嚥≪뮇�뒲 占쎌뵠沃섎챷占쏙옙�솁占쎌뵬占쎌뱽 占쎄퐫占쏙옙 野껓옙
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
	int num;
	@PostMapping("eSeatCheck")
	public String eSeatCheck(MultipartHttpServletRequest mt, @RequestParam String ex_title, @RequestParam String ex_buyer, exhibitionSeatDTO edto) {
		edto.setEx_title(mt.getParameter("ex_title"));
		edto.setEx_date(mt.getParameter("startDate"));
		edto.setEx_buyer(mt.getParameter("ex_buyer"));
		edto.setEx_place(mt.getParameter("ex_place"));
		String cnt = mt.getParameter("count");
		int count = Integer.parseInt(cnt);
		String pri = mt.getParameter("price");
		int price = Integer.parseInt(pri);
		int rprice = price/count;
		
		edto.setExS_num(count);
		edto.setExS_price(rprice);

		List<String> seatList = new ArrayList<>();
		for (int i=0; i<count; i++) {
			if(i==0) {
				num++;
				System.out.println(num);
				String seatId = mt.getParameter("ex_title")+"_"+mt.getParameter("startDate")+"_"+num;
				seatList.add(seatId);
				edto.setExS_id(seatId);
				fs.eSeatSave(edto);
				System.out.print("seatId : ");
				System.out.println(seatId);
			}else if(i==1) {
				num++;
				System.out.println(num);
				String seatId = mt.getParameter("ex_title")+"_"+mt.getParameter("startDate")+"_"+num;
				seatList.add(seatId);
				edto.setExS_id(seatId);
				fs.eSeatSave(edto);
				System.out.print("seatId : ");
				System.out.println(seatId);
			}else if(i==2) {
				num++;
				String seatId = mt.getParameter("ex_title")+"_"+mt.getParameter("startDate")+"_"+num;
				seatList.add(seatId);
				edto.setExS_id(seatId);
				fs.eSeatSave(edto);
			}else if(i==3) {
				num++;
				String seatId = mt.getParameter("ex_title")+"_"+mt.getParameter("startDate")+"_"+num;
				seatList.add(seatId);
				edto.setExS_id(seatId);
				fs.eSeatSave(edto);
			}else if(i==4) {
				num++;
				String seatId = mt.getParameter("ex_title")+"_"+mt.getParameter("startDate")+"_"+num;
				seatList.add(seatId);
				edto.setExS_id(seatId);
				fs.eSeatSave(edto);
			}
		}
		edto.setSeatList(seatList);
		System.out.println(edto.getSeatList());
		
		return "redirect:exhibition_Payment?ex_title="+ex_title+"&&ex_buyer="+ex_buyer+"&&price="+price;
	}
	@GetMapping("exhibition_Payment")
	public String exhibitionPayment(@RequestParam String ex_title, @RequestParam String ex_buyer, @RequestParam int price, Model model) {
		model.addAttribute("title", ex_title);
		model.addAttribute("buyer", ex_buyer);
		model.addAttribute("price", price);
		
		return "reservation/exhibition/exhibition_Payment";
	}
	@PostMapping("exhibition_BuySeat")
	public String exhibitionBuySeat(HttpServletRequest req, payDTO pdto) {
		pdto.setAccount(req.getParameter("account"));
		String account= pdto.getAccount();
		pdto.setTitle(req.getParameter("title"));
		String title= pdto.getTitle();
		pdto.setName(req.getParameter("buyer"));
		String name= pdto.getName();
		String pri = req.getParameter("price");
		int price = Integer.parseInt(pri);
		pdto.setPrice(price);
		
		int result = rs.BuySeat(account, price);
		if(result==1) {
			rs.eBuySeat(title, name);
		}else {
			return "redirect:exhibition_board";
		}
		return "redirect:eSuccessPay";
	}
	@GetMapping("eSuccessPay")
	public String eSuccessPay() {
		return "reservation/exhibition/successPay";
	}
	
	
	@GetMapping("reservationAllList")
	public String reservationAllList(Model model, HttpSession session) {
		String con_buyer = (String) session.getAttribute(LoginSession.GLOGIN);
		model.addAttribute("list", rs.reservationAllList(con_buyer));
		return "reservation/reservationAllList";
	}
	@PostMapping("presentTicket")
	public String presentTicket(HttpServletRequest req, Model model) {
		System.out.println(req.getParameter("seat"));
		String conS_id = req.getParameter("seat");
		model.addAttribute("list", rs.selectTicket(conS_id));
		return "reservation/presentTicket";
	}
	@PostMapping("presentChk")
	public String presentChk(HttpServletRequest req) {
		System.out.println(req.getParameter("receiver"));
		System.out.println(req.getParameter("seat"));
		String con_buyer = req.getParameter("receiver");
		String conS_id = req.getParameter("seat");
		rs.presentTicket(con_buyer, conS_id);
		return "redirect:reservationAllList";
	}
}
