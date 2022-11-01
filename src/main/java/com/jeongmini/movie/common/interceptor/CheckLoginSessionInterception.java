package com.jeongmini.movie.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CheckLoginSessionInterception extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		String uri = request.getRequestURI();
		
		if(session.getAttribute("sessSeq") == null ) {
			if(uri.startsWith("/code") || uri.startsWith("/codeGroup") || uri.equals("/admin/memberList") || uri.equals("/movie/boxofficeApi")) {
				response.sendRedirect("/admin/login");
				return false;
			} 
		} else {
			if(uri.equals("/member/signup") ||  uri.equals("/member/signupCompleted")) { 
				response.sendRedirect("/");
				return false; 
			} else if(session.getAttribute("adminNy").equals(0)) {
				if(uri.startsWith("/code") || uri.startsWith("/codeGroup") || uri.equals("/member/memberList")) {
					response.sendRedirect("/");
					return false;
				} 
			}
		}
		return super.preHandle(request, response, handler);
	}

}
