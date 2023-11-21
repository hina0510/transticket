package com.care.root.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.care.root.commember.service.ComMemberService;
import com.care.root.common.LoginSession;
import com.care.root.member.dto.ComMemberDTO;

public class ComAutoLoginInterceptor extends HandlerInterceptorAdapter implements LoginSession {

	@Autowired ComMemberService cms;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie cloginCookie = WebUtils.getCookie(request, "cloginCookie");
		if(cloginCookie != null) {
			ComMemberDTO dto = cms.getComSessionId(cloginCookie.getValue());
			if(dto!=null) {
				System.out.println("===============");
				System.out.println(CLOGIN);
				request.getSession().setAttribute(CLOGIN, dto.getId());
			}
		}
		return true;
	}
		
}
