package com.care.root.transboard;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.common.LoginSession;
import com.care.root.reservation.service.reservationService;
import com.care.root.transboard.dto.TransBoardDTO;
import com.care.root.transboard.service.TransBoardService;

@Controller
@RequestMapping("/transboard")
public class TransBoardController {
	@Autowired reservationService  rs;
	@Autowired TransBoardService ts;
	
	@GetMapping("transBoardList")
	public String transboardAllList(Model model, @RequestParam(value="type", required=false) String type, @RequestParam(value="keyword", required=false) String keyword, @RequestParam(required = false, defaultValue = "1") int num) throws Exception {
		if(type != null  && keyword !=null) {
			Map<String, Object> map = ts.selectSearch(model, type, keyword, num);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("repeat", map.get("repeat"));
			
		}else {
			Map<String, Object> map = ts.transboardAllList(num);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("repeat", map.get("repeat"));
		}
		return "transboard/transBoardList";
	}
	
	@PostMapping("transWrite")
	public String transWrite(HttpServletRequest req, HttpSession session, Model model) {
		System.out.println(req.getParameter("seat"));
		String conS_id = req.getParameter("seat");
		model.addAttribute("list", rs.selectTicket(conS_id));
		return "transboard/transBoardWrite";
	}
	
	@PostMapping("transWriteSave")
	public String transWriteSave(HttpServletRequest req, TransBoardDTO dto) {
		dto.setCategory(req.getParameter("category"));
		dto.setTitle(req.getParameter("title"));
		dto.setId(req.getParameter("id"));
		dto.setContent(req.getParameter("seat"));
		String conS_id = req.getParameter("seat");
		ts.transWriteSave(dto, conS_id);
		
		return "redirect:transBoardList";
	}
	
	@GetMapping("transBoardView")
	public String transBoardView(@RequestParam int writeNo, Model model, HttpSession session) {
		String id;
		if(session.getAttribute(LoginSession.GLOGIN) == null) {
			id = "undefined";
		}else {
			id = (String) session.getAttribute(LoginSession.GLOGIN);
		}
		model.addAttribute("dto", ts.transView(writeNo));
		model.addAttribute("genId", id);
		model.addAttribute("likes", ts.transLikeChk(id, writeNo));
		return "transboard/transBoardView";
	}
	
	@PostMapping("buyTicket")
	public String buyTicket(HttpServletRequest req, Model model) {
		System.out.println(req.getParameter("writeNo"));
		String writeNo = req.getParameter("writeNo");
		System.out.println(req.getParameter("seat"));
		String conS_id = req.getParameter("seat");
		System.out.println(req.getParameter("seller"));
		String name = req.getParameter("seller");
		model.addAttribute("writeNo", writeNo);
		model.addAttribute("list", rs.selectTicket(conS_id));
		model.addAttribute("alist", rs.getAccount(name));
		return "transboard/buyTicket";
	}
	@PostMapping("ticketChk")
	public String ticketChk(HttpServletRequest req, Model model) {
		System.out.println(req.getParameter("writeNo"));
		String w_No = req.getParameter("writeNo");
		int writeNo = Integer.parseInt(w_No);
		System.out.println(req.getParameter("seat"));
		String conS_id = req.getParameter("seat");
		String sAccount = req.getParameter("sAccount");
		String con_buyer = req.getParameter("buyer");
		String bAccount = req.getParameter("bAccount");
		String pri = req.getParameter("price");
		int price = Integer.parseInt(pri);
		
		int result = rs.BuySeat(bAccount, price);
		if(result==1) {
			rs.sellSeat(sAccount, price);
			rs.presentTicket(con_buyer, conS_id);
			ts.seatWriteDown(conS_id);
			ts.transDelete(writeNo);
		}else {
			return "redirect:transBoardList";
		}
		return "transboard/successPay";
	}
	
	
	@PostMapping("likes")
	public String likes(@RequestParam String id, @RequestParam int writeNo) {
		System.out.println(id + writeNo);
		ts.transLike(id, writeNo);
		return "redirect:transBoardView?writeNo="+ writeNo;
	}
	
	@GetMapping("transModify")
	public String transModify(@RequestParam int writeNo, Model model) {
		model.addAttribute("dto", ts.transView(writeNo));
		return "transboard/transBoardModify";
	}
	
	@PostMapping("transModifySave") 
	public String transModifySave(@RequestParam int writeNo, MultipartHttpServletRequest mt){
		TransBoardDTO dto = ts.transView(writeNo);
		dto.setCategory(mt.getParameter("category"));
		dto.setTitle(mt.getParameter("title"));
		dto.setId(mt.getParameter("id"));
		dto.setContent(mt.getParameter("content"));
		
		ts.transModifySave(dto);
		
		return "redirect:transBoardView?writeNo="+writeNo;
	}
	
	@GetMapping("transDelete")
	public String transDelete(@RequestParam int writeNo) {
		ts.transDelete(writeNo);
		return "redirect:transBoardList";
	}
}
