package com.jeongmini.movie.modules.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeongmini.movie.HomeController;
import com.jeongmini.movie.modules.code.Code;
import com.jeongmini.movie.modules.code.CodeServiceImpl;

@Controller
@RequestMapping(value="/member/")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberServiceImpl service;
	
	@Autowired
	CodeServiceImpl codeServiceImpl;
	
	@RequestMapping(value="memberList")
	public String memberList(Model model) throws Exception {
		
		List<Member> list = service.selectList();
		model.addAttribute("list", list);
		
		return "infra/member/xdmin/memberList";
		
	}
	
	@RequestMapping(value="signup")
	public String signupView(Model model) throws Exception {
		
		List<Code> codeList = codeServiceImpl.emailSelectList();
		model.addAttribute("code", codeList);
		
		return "infra/member/user/signupForm";
	}
	
	@RequestMapping(value="signupCompleted")
	public String signupCompletedView() throws Exception {
		
		return "infra/member/user/signupCompleted";
		
	}
	
	@RequestMapping(value="memberInst")
	public String memberInst(MemberVo vo) throws Exception {
		
		int result = service.insert(vo);
		System.out.println("insert 성공 : " + result);
		
		return "redirect:/member/signupCompleted"; 
	}
	
	@RequestMapping(value="login")
	public String login(Model model, Member dto, HttpServletRequest request) throws Exception {
		Member member = service.login(dto);
		
		if(member != null) {
			logger.info("로그인성공 login ID : " + member.getLoginId() + " user name : " + member.getName());
			
			HttpSession session = request.getSession();
			
			session.setAttribute("loginId", member.getLoginId());
			session.setAttribute("name", member.getName());
		} else {
			logger.info("로그인 실패 " );
		}
		
		return "redirect:/";
	}

}
