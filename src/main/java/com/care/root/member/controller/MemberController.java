package com.care.root.member.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.commember.service.ComMemberService;
import com.care.root.common.LoginSession;
import com.care.root.genmember.service.GenMemberService;
import com.care.root.member.dto.ComMemberDTO;
import com.care.root.member.dto.GenMemberDTO;


@Controller
@RequestMapping("member")
public class MemberController implements LoginSession{
	@Autowired ComMemberService cms;
	@Autowired GenMemberService gms;
	@GetMapping("prelogin")
	public String prelogin() {
		return "member/prelogin";
	}
	@GetMapping("genmember/gen_login")
	public String genlogin() {
		return "member/gen_login";
	}
	@GetMapping("commember/com_login")
	public String comlogin() {
		return "member/com_login";
	}
	@PostMapping("logChk")
	public String logChk(@RequestParam String id, 
						@RequestParam String pwd,
						@RequestParam(required=false, defaultValue="off") String autoLogin,
						HttpSession session,
						RedirectAttributes rs) {
		System.out.println(autoLogin);
		int result = cms.logChk(id,pwd);
		if(result==0) {
			rs.addAttribute("id", id);
			if(id.equals("admin")) {
				session.setAttribute(MLOGIN, id);
			}else {
				session.setAttribute( CLOGIN , id);
			}
			rs.addAttribute("autoLogin", autoLogin);
			return "redirect:successLogin";
		}
		rs.addFlashAttribute("msg", "로그인실패");
		return "redirect:prelogin";
	}
	@PostMapping("logChk1")
	public String logChk1(@RequestParam String id, 
						@RequestParam String pwd,
						@RequestParam(required=false, defaultValue="off") String autoLogin,
						HttpSession session,
						RedirectAttributes rs) {
		int result = gms.logChk1(id,pwd);
		if(result==0) {
			rs.addAttribute("id", id);
			session.setAttribute( GLOGIN , id);
			rs.addAttribute("autoLogin", autoLogin);
			return "redirect:successLogin1";
		}
		rs.addFlashAttribute("msg", "로그인실패");
		return "redirect:prelogin";
	}
	@GetMapping("successLogin")
	public String successLogin(@RequestParam String id, @RequestParam String autoLogin, HttpServletResponse res, HttpSession session, RedirectAttributes rs, Model model) {
		System.out.println("autologin :"+autoLogin);
		if(autoLogin.equals("on")) {
			int limitTime = 60*60*24*90; // 초 분 시 일 해서 90일 설정
			Cookie cloginCookie = new Cookie("cloginCookie", session.getId());
			cloginCookie.setPath("/");
			cloginCookie.setMaxAge(limitTime);
			res.addCookie(cloginCookie);
			cms.keepLogin(session.getId(), id);
		}
		rs.addFlashAttribute("msg","기업로그인성공");
		model.addAttribute("cominfo", cms.getMember(id));
		return "redirect:prelogin";
	}
	@GetMapping("successLogin1")
	public String successLogin1(@RequestParam String id,@RequestParam String autoLogin, HttpServletResponse res, HttpSession session, RedirectAttributes rs, Model model) {
		if(autoLogin.equals("on")) {
			int limitTime = 60*60*24*90; // 초 분 시 일 해서 90일 설정
			Cookie gloginCookie = new Cookie("gloginCookie", session.getId());
			gloginCookie.setPath("/");
			gloginCookie.setMaxAge(limitTime);
			res.addCookie(gloginCookie);
			gms.keepLogin(session.getId(), id);
		}
		rs.addFlashAttribute("msg","개인로그인성공");
		model.addAttribute("geninfo", gms.getMember(id));
		return "redirect:prelogin";
	}
	@GetMapping("com_register_view")
	public String comregisterView() {
		return "member/commember/com_register_view";
	}
	@GetMapping("gen_register_view")
	public String genregisterView() {
		return "member/genmember/gen_register_view";
	}
	@PostMapping("comregister")
	public String comregister(HttpServletRequest req, ComMemberDTO dto, RedirectAttributes rtt) {
		cms.comregister(dto , req.getParameterValues("addr"));
		rtt.addFlashAttribute("msg","가입완료");
		return "redirect:prelogin";
	}
	@PostMapping("genregister")
	public String genregister(HttpServletRequest req,GenMemberDTO dto, RedirectAttributes rtt) {
		gms.genregister(dto , req.getParameterValues("addr"));
		rtt.addFlashAttribute("msg","가입완료");
		return "redirect:prelogin";
	}
	@GetMapping("clogout")
	public String clogout(HttpSession session, @CookieValue(value="cloginCookie",required = false) Cookie cookie,
			HttpServletResponse res) {
		if(cookie != null) {
			cookie.setMaxAge(0);
			res.addCookie(cookie);
			cms.keepLogin("nan", (String)session.getAttribute(CLOGIN));
		}
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("glogout")
	public String glogout(HttpSession session, @CookieValue(value="gloginCookie",required = false) Cookie cookie,
			HttpServletResponse res) {
		if(cookie != null) {
			cookie.setMaxAge(0);
			res.addCookie(cookie);
			gms.keepLogin("nan", (String)session.getAttribute(GLOGIN));
		}
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("com_info")
	public String cominfo(@RequestParam String id, Model model) {
		
		model.addAttribute("cominfo", cms.getMember(id));
		return "member/commember/com_info";
	}
	@GetMapping("clist")
	public String clist( Model model) {
		model.addAttribute("clist", cms.getList());
		return "member/commember/clist";
	}
	@GetMapping("com_modify")
	public String com_modify(@RequestParam String id, Model model) {
		model.addAttribute("cominfo", cms.getMember(id));
		return "member/commember/com_modify";
	}
	@PostMapping("commodify")
	public String commodify(HttpServletRequest req, ComMemberDTO dto) {
		cms.commodify(dto , req.getParameterValues("addr"));
		
		return "redirect:com_mypage";
	}
	@GetMapping("gen_info")
	public String geninfo(@RequestParam String id, Model model) {
		model.addAttribute("geninfo", gms.getMember(id));
		return "member/genmember/gen_info";
	}
	@GetMapping("glist")
	public String glist( Model model) {
		model.addAttribute("glist", gms.getList());
		return "member/genmember/glist";
	}
	@GetMapping("gen_modify")
	public String gen_modify(@RequestParam String id, Model model) {
		model.addAttribute("geninfo", gms.getMember(id));
		return "member/genmember/gen_modify";
	
	}
	@PostMapping("genmodify")
	public String genmodify(HttpServletRequest req, GenMemberDTO dto) {
		gms.genmodify(dto , req.getParameterValues("addr"));
		
		return "redirect:gen_mypage";
	}
	@GetMapping("comdelete")
	public String comdelete(@RequestParam String id, HttpSession session) {
		cms.comdelete(id);
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("gendelete")
	public String gendelete(@RequestParam String id, HttpSession session) {
		gms.gendelete(id);
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("gen_mypage")
	public String gen_mypage(Model model, HttpSession session) {
		String id = (String) session.getAttribute(GLOGIN);
		model.addAttribute("geninfo", gms.getMember(id));
		return "member/genmember/gen_mypage";
	}
	@GetMapping("com_mypage")
	public String com_mypage(Model model, HttpSession session) {
		String id = (String) session.getAttribute(CLOGIN);
		model.addAttribute("cominfo", cms.getMember(id));
		return "member/commember/com_mypage";
	}
	@GetMapping("admin")
	public String admin(Model model, HttpSession session) {
		String id = (String) session.getAttribute(MLOGIN);
		model.addAttribute("cominfo", cms.getMember(id));
		return "member/admin";
	}
}