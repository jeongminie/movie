package com.jeongmini.movie.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
//		List<Code> codeList = codeServiceImpl.emailSelectList();
//		model.addAttribute("code", codeList);
		
		return "infra/member/user/signupForm";
	}
	
	@RequestMapping(value="signupCompleted")
	public String signupCompletedView() throws Exception {
		
		return "infra/member/user/signupCompleted";
	}
	
	@RequestMapping(value="memberInst")
	public String memberInst(Member dto) throws Exception {
		
		int result = service.insert(dto);
		
		if(result == 0) {
			System.out.println("insert 실패 : " + result);
		} else {
			System.out.println("insert 성공 : " + result);
		}

		return "redirect:/member/signupCompleted"; 
	}
	
	@RequestMapping(value="login")
	public String login(Member dto, MemberVo vo, Model model, HttpServletRequest request) throws Exception {
		Member member = service.login(dto);
		
		String url = request.getHeader("referer");
		System.out.println(url);
		
		if(member != null) {
			logger.info("로그인성공 login ID : " + member.getLoginId() + " user name : " + member.getName());
			
			HttpSession session = request.getSession();
			
			session.setAttribute("loginId", member.getLoginId());
			session.setAttribute("name", member.getName());
		} else {
			logger.info("로그인 실패 ");
		}
		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="idCheck")
	@ResponseBody
	public Map<String, Boolean> idCheck(Model model, MemberVo vo) throws Exception {
		Map<String, Boolean> result = new HashMap<>();
		
		if(service.idCheck(vo)) {
			result.put("duplication", true);
		} else {
			result.put("duplication", false);
		}
		System.out.println(result);
		
		return result;
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		session.removeAttribute("loginId");
		session.removeAttribute("name");
		
		logger.info("로그아웃 완료");
		
		return "redirect:/";
	}

}
