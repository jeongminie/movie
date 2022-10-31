package com.jeongmini.movie.modules.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeongmini.movie.modules.codegroup.CodeGroup;

@Controller
@RequestMapping(value= "/admin/")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value="memberList")
	public String memberList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		List<Member> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		System.out.println("vo.getShValue() : " + vo.getShValue());
		System.out.println("vo.getSeq() : " + vo.getSeq());
		
		return "infra/member/xdmin/memberList";
		
	}
	
	@RequestMapping(value="memberInst")
	public String signup(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		int result = service.insert(dto);
		System.out.println("------------------" + dto.getSeq());
		vo.setSeq(dto.getSeq());
		//vo 파라미터 리다이렉트 경로로 전달
		redirectAttributes.addFlashAttribute("vo", vo);
		
		if(result == 0) {
			System.out.println("insert 실패 : " + result);
		} else {
			System.out.println("insert 성공 : " + result);
		}

		return "redirect:/admin/memberRegForm"; 
	}
	
	@RequestMapping(value="memberRegForm")
	public String memberRegForm(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		Member member = service.selectOne(vo);
		model.addAttribute("item", member);
		
		return "infra/member/xdmin/memberRegForm";
	}
	
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
			
			session.setAttribute("sessSeq", member.getSeq());
			session.setAttribute("loginId", member.getLoginId());
			session.setAttribute("name", member.getName());
			session.setAttribute("adminNy", member.getAdminNy());
			
		} else {
			logger.info("로그인 실패 ");
		}
		
		return "redirect:../code/codeList";
	}
}
