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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeongmini.movie.modules.code.CodeServiceImpl;

@Controller
@RequestMapping(value= "/member/")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberServiceImpl service;
	
	@Autowired
	CodeServiceImpl codeServiceImpl;
	
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
	
	@RequestMapping(value="signupProc")
	public String signup(Member dto) throws Exception {
		
		int result = service.insert(dto);
		
		if(result == 0) {
			System.out.println("insert 실패 : " + result);
		} else {
			System.out.println("insert 성공 : " + result);
		}

		return "redirect:/member/signupCompleted"; 
	}
	
	@RequestMapping(value="login")
	@ResponseBody
	public Map<String, Object> login(Member dto, MemberVo vo, Model model, HttpServletRequest request) throws Exception {
		Member member = service.login(dto);
		
		Map<String, Object> result = new HashMap<>();
		
//		String url = request.getHeader("referer");
//		System.out.println(url);
		
		if(member != null) {
			logger.info("로그인성공 login ID : " + member.getLoginId() + " user name : " + member.getName() + " user name : " + member.getSeq());
			
			HttpSession session = request.getSession();
			
			session.setAttribute("sessSeq", member.getSeq());
			session.setAttribute("loginId", member.getLoginId());
			session.setAttribute("name", member.getName());
			session.setAttribute("adminNy", member.getAdminNy());
			session.setAttribute("phone", member.getPhone());

			result.put("result", "success");
		} else {
			logger.info("로그인 실패 ");
			result.put("result", "fail");
		}
		
		return result;
		
//		if(member.getAdminNy() == 1) {
//			return "redirect:../code/codeList";
//		} else {
//			return "redirect:"+url;
//		}
		
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
		
//		session.removeAttribute("loginId");
//		session.removeAttribute("name");
		session.invalidate();
		
		String url = request.getHeader("referer");
		
		
		logger.info("로그아웃 완료");
		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="mypage")
	public String mypageView(Member dto, Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		dto.setPseq((Integer)session.getAttribute("sessSeq"));
		dto.setSeq((Integer)session.getAttribute("sessSeq"));
		
		Member item = service.selectProfile(dto);
		model.addAttribute("profile", item);
		
		Member member = service.member(dto);
		model.addAttribute("member", member);
		
		return "infra/member/user/mypage";
	}
	
	@RequestMapping(value="userinfo")
	public String userinfoView(Model model) throws Exception {
		
		return "infra/member/user/userinfo";
	}
	
	@RequestMapping(value="profileUploaded")
	@ResponseBody
	public Map<String, Object> profileInst(Member dto, HttpServletRequest request) throws Exception {
		System.out.println(dto.getFilePath());
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		dto.setPseq((Integer)session.getAttribute("sessSeq"));
		
		if(service.profileUploaded(dto) == 1) {
			result.put("result", "success");
			logger.info("image 성공");
		} else {
			logger.info("image 실패");
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	

}
