package com.care.root.commember.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.commember.service.ComMemberService;
import com.care.root.common.LoginSession;
import com.care.root.dto.ComMemberDTO;
import com.care.root.dto.GenMemberDTO;
import com.care.root.genmember.service.GenMemberService;


@Controller
@RequestMapping("member")
public class MemberController implements LoginSession{
	@Autowired(required = false) ComMemberService cms;
	@Autowired GenMemberService gms;
	@GetMapping("prelogin")
	public String prelogin() {
		return "member/prelogin";
	}
	@GetMapping("preregister")
	public String preregister() {
		return "member/preregister";
	}
	@GetMapping("gen_login")
	public String genlogin() {
		return "member/gen_login";
	}
	@GetMapping("com_login")
	public String comlogin() {
		return "member/com_login";
	}
	@PostMapping("logChk")
	public String logChk(@RequestParam String id, 
						@RequestParam String pwd,
						
						HttpSession session,
						RedirectAttributes rs) {
		int result = cms.logChk(id,pwd);
		if(result==0) {
			rs.addAttribute("id", id);
			session.setAttribute( LOGIN , id);
			return "redirect:successLogin";
		}
		return "redirect:com_login";
	}
	@PostMapping("logChk1")
	public String logChk1(@RequestParam String id, 
						@RequestParam String pwd,
						
						HttpSession session,
						RedirectAttributes rs) {
		int result = gms.logChk1(id,pwd);
		if(result==0) {
			rs.addAttribute("id", id);
			session.setAttribute( LOGIN , id);
			return "redirect:successLogin1";
		}
		return "redirect:gen_login";
	}
	@GetMapping("successLogin")
	public String successLogin(@RequestParam String id, Model model) {
		model.addAttribute("cominfo", cms.getMember(id));
		return "member/successLogin";
	}
	@GetMapping("successLogin1")
	public String successLogin1(@RequestParam String id, Model model) {
		model.addAttribute("geninfo", gms.getMember(id));
		return "member/successLogin";
	}
	@GetMapping("com_register_view")
	public String comregisterView() {
		return "member/com_register_view";
	}
	@GetMapping("gen_register_view")
	public String genregisterView() {
		return "member/gen_register_view";
	}
	@PostMapping("comregister")
	public String comregister(HttpServletRequest req, ComMemberDTO dto) {
		cms.comregister(dto , req.getParameterValues("addr"));
		return "redirect:com_login";
	}
	@PostMapping("genregister")
	public String genregister(HttpServletRequest req,GenMemberDTO dto) {
		gms.genregister(dto , req.getParameterValues("addr"));
		return "redirect:gen_login";
	}
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("com_info")
	public String cominfo(@RequestParam String id, Model model) {
		System.out.println(id);
		model.addAttribute("cominfo", cms.getMember(id));
		return "member/com_info";
	}
	@GetMapping("clist")
	public String clist( Model model) {
		model.addAttribute("clist", cms.getList());
		return "member/clist";
	}
	@GetMapping("com_modify")
	public String com_modify(@RequestParam String id, Model model) {
		model.addAttribute("cominfo", cms.getMember(id));
		return "member/com_modify";
	
	}
	@PostMapping("commodify")
	public String commodify(HttpServletRequest req, ComMemberDTO dto) {
		cms.commodify(dto , req.getParameterValues("addr"));
		
		return "redirect:com_login";
	}
	@GetMapping("gen_info")
	public String geninfo(@RequestParam String id, Model model) {
		System.out.println(id);
		model.addAttribute("geninfo", gms.getMember(id));
		return "member/gen_info";
	}
	@GetMapping("glist")
	public String glist( Model model) {
		model.addAttribute("glist", gms.getList());
		return "member/glist";
	}
	@GetMapping("gen_modify")
	public String gen_modify(@RequestParam String id, Model model) {
		model.addAttribute("geninfo", gms.getMember(id));
		return "member/gen_modify";
	
	}
	@PostMapping("genmodify")
	public String genmodify(HttpServletRequest req, GenMemberDTO dto) {
		gms.genmodify(dto , req.getParameterValues("addr"));
		
		return "redirect:gen_login";
	}
	
}
