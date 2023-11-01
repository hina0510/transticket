package com.care.root.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.care.root.common.LoginSession;
import com.care.root.genmember.service.GenMemberService;
import com.care.root.member.dto.GenMemberDTO;

public class GenAutoLoginInterceptor extends HandlerInterceptorAdapter implements LoginSession {
	@Autowired GenMemberService gms;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie gloginCookie = WebUtils.getCookie(request, "gloginCookie");
		if(gloginCookie != null) {
			GenMemberDTO dto = gms.getGenSessionId(gloginCookie.getValue());
			if(dto!=null) {
				System.out.println("===============");
				System.out.println(GLOGIN);
				request.getSession().setAttribute(GLOGIN, dto.getId());
			}
		}
		return true;
	}
}
