package com.care.root.email;

import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.care.root.member.dto.ComMemberDTO;
import com.care.root.mybatis.member.ComMemberMapper;
@Controller
public class ComEmailController {
	BCryptPasswordEncoder encoder;
	@Autowired(required=false) ComMemberDTO dto;
	@Autowired(required=false) ComMemberMapper mapper;
	@Autowired JavaMailSender mailSender;
	@GetMapping("member/com_pw_find")
	public String pw_find() {
		return "member/commember/com_pw_find";
	}
	
	@PostMapping("member/com_pw_auth")
	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = (String)request.getParameter("email");
		String id = (String)request.getParameter("id");

		dto = mapper.selectMember(email);
			
		if(dto != null) {
		Random r = new Random();
		int num = r.nextInt(999999); // ������������
		
		if (dto.getId().equals(id)) {
			session.setAttribute("email", dto.getEmail());

			String setfrom = "jungeogus@google.com"; // naver 
			String tomail = email; //�޴»��
			String title = "비밀번호변경 인증 이메일 입니다"; 
			String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
					+ "비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title);
				messageHelper.setText(content); 

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/commember/com_pw_auth");
			mv.addObject("num", num);
			return mv;
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/commember/com_pw_find");
			request.setAttribute("msg", "����");
			return mv;
		}
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/commember/com_pw_find");
			request.setAttribute("msg", "����");
			return mv;
		}
}
	@RequestMapping(value = "member/com_pw_set", method = RequestMethod.POST)
	public String pw_set(@RequestParam(value="email_injeung") String email_injeung,
				@RequestParam(value = "num") String num, HttpServletRequest req, Model model) throws IOException{
			
			System.out.println(num);
			model.addAttribute("num", num);
			if(email_injeung.equals(num)) {
				return "member/commember/com_pw_new";
			}
			else {
				req.setAttribute("msg", "����");
				return "member/commember/com_pw_auth";
			}
	}
	public ComEmailController() {
		encoder = new BCryptPasswordEncoder();
	}
	@RequestMapping(value = "member/com_pw_new", method = RequestMethod.POST)
	public String pw_new(@RequestParam String pwd,ComMemberDTO dto, HttpSession session) throws IOException{
		System.out.println(pwd);
		dto.setPwd(encoder.encode(dto.getPwd()));
		if(pwd!=null) {
			try {
				mapper.pwUpdate(dto);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}return "member/prelogin";
}
}