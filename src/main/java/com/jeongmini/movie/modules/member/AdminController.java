package com.jeongmini.movie.modules.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value= "/admin/")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	MemberServiceImpl service;
	
	//관리자 화면
	@RequestMapping(value="login")
	public String xdminLoginView() throws Exception {
		
		return "infra/member/xdmin/loginForm";
	}
	
	
	@RequestMapping(value="loginProc")
	public String login(Member dto, MemberVo vo, Model model, HttpServletRequest request) throws Exception {
		Member member = service.login(dto);
		
		if(member != null) {
			logger.info("로그인성공 login ID : " + member.getLoginId() + " user name : " + member.getName());
			
			HttpSession session = request.getSession();
			
			session.setAttribute("loginId", member.getLoginId());
			session.setAttribute("name", member.getName());
		} else {
			logger.info("로그인 실패 ");
		}
		
		return "redirect:../code/codeList";
	}
}
