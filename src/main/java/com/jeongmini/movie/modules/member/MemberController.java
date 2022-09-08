package com.jeongmini.movie.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/member/")
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value="memberList")
	public String memberList(Model model) throws Exception {
		
		List<Member> list = service.selectList();
		model.addAttribute("list", list);
		
		return "infra/member/xdmin/memberList";
		
	}
	
	@RequestMapping(value="signup")
	public String signupView() throws Exception {
		
		return "infra/member/user/signupForm";
	}
	
	@RequestMapping(value="signupCompleted")
	public String signupCompletedView() throws Exception {
		
		return "infra/member/user/signupCompleted";
		
	}
	
	@RequestMapping(value="memberInst")
	public String memberInst(Member dto) throws Exception {
		
		int result = service.insert(dto);
		System.out.println("insert 성공 : " + result);
		
		return "redirect:/member/signupCompleted"; 
	}

}
