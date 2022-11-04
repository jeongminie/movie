package com.jeongmini.movie.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeongmini.movie.common.constants.Constants;
import com.jeongmini.movie.common.util.CoolSms;
import com.jeongmini.movie.modules.code.CodeServiceImpl;
import com.jeongmini.movie.modules.movie.Movie;
import com.jeongmini.movie.modules.movie.MovieServiceImpl;
import com.jeongmini.movie.modules.movie.MovieVO;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberServiceImpl service;
	
	@Autowired
	CodeServiceImpl codeServiceImpl;
	
	@Autowired
	MovieServiceImpl movieServiceImpl;
	
	@RequestMapping(value="/member/signup")
	public String signupView(Model model) throws Exception {
		
//		List<Code> codeList = codeServiceImpl.emailSelectList();
//		model.addAttribute("code", codeList);
		
		return "infra/member/user/signupForm";
	}
	
	@RequestMapping(value="/member/signupCompleted")
	public String signupCompletedView() throws Exception {
		
		return "infra/member/user/signupCompleted";
	}
	
	@RequestMapping(value="/member/signupProc")
	public String signup(Member dto) throws Exception {
		
		int result = service.insert(dto);
		
		if(result == 0) {
			System.out.println("insert 실패 : " + result);
		} else {
			System.out.println("insert 성공 : " + result);
		}

		return "redirect:/member/signupCompleted"; 
	}
	
	@RequestMapping(value="/member/update")
	@ResponseBody
	public Map<String, Object> update(Member dto, HttpServletRequest request) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		dto.setSeq((Integer)session.getAttribute("sessSeq"));
		
		if(service.update(dto) == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	@RequestMapping(value="/member/login")
	@ResponseBody
	public Map<String, Object> login(Member dto, MemberVo vo, Model model, HttpServletRequest request) throws Exception {
		Member member = service.login(dto);
		
		Map<String, Object> result = new HashMap<>();
		
//		String url = request.getHeader("referer");
//		System.out.println(url);
		
		if(member != null) {
			logger.info("로그인성공 login ID : " + member.getLoginId() + " user name : " + member.getName() + " user name : " + member.getSeq());
			
			session(member, request); 
			
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
	
	@RequestMapping(value="/member/idCheck")
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
	
	@RequestMapping(value="/member/logout")
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
	
	@RequestMapping(value="/mypage/openAlarmList")
	public String openAlarmListView(Model model, MovieVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		vo.setUserSeq((Integer)session.getAttribute("sessSeq"));
		System.out.println(vo.getUserSeq());
		
		List<Movie> list = movieServiceImpl.selectOpenAlarm(vo);
		model.addAttribute("list", list);
		
		return "infra/member/user/openAlarmList";
	}
	
	@RequestMapping(value="/mypage/myinfo")
	public String myinfoView(Model model) throws Exception {
		
		return "infra/member/user/myinfo";
	}
	
	@RequestMapping(value="/mypage/userinfo")
	public String userinfoView(Member dto, Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		dto.setPseq((Integer)session.getAttribute("sessSeq"));
		dto.setSeq((Integer)session.getAttribute("sessSeq"));
		
		Member item = service.selectProfile(dto);
		model.addAttribute("profile", item);
		
		Member member = service.member(dto);
		model.addAttribute("member", member);
		
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
	
	@RequestMapping("/check/sendSMS")
    @ResponseBody
    public String sendSMS(Member dto) {
		System.out.println(dto.getPhone());

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
        
        System.out.println("수신자 번호 : " + dto.getPhone());
        System.out.println("인증번호 : " + numStr);
        
        CoolSms.singleSms(dto.getPhone(), numStr);
        
        return numStr;
    }
	
	@ResponseBody
	@RequestMapping(value = "/member/kakaoLoginProc")
	public Map<String, Object> kakaoLoginProc(Member dto, HttpServletRequest request) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
	    
		Member kakaoLogin = service.snsLoginCheck(dto);
		
		
		 System.out.println("test : " + dto.getToken());
		
		if (kakaoLogin == null) {
			service.kakaoInsert(dto);
			
			// session(dto.getSeq(), dto.getId(), dto.getName(), dto.getEmail(), dto.getUser_div(), dto.getSnsImg(), dto.getSns_type(), httpSession);
            session(dto, request); 
            result.put("rt", "success");
		} else {
			
			// session(kakaoLogin.getSeq(), kakaoLogin.getId(), kakaoLogin.getName(), kakaoLogin.getEmail(), kakaoLogin.getUser_div(), kakaoLogin.getSnsImg(), kakaoLogin.getSns_type(), httpSession);
			session(kakaoLogin, request);
			result.put("rt", "success");
		}
		return result;
	}

	 public void session(Member dto, HttpServletRequest request) {
		 HttpSession session = request.getSession();

		 session.setAttribute("sessSeq", dto.getSeq());    
		 session.setAttribute("loginId", dto.getLoginId());
		 session.setAttribute("name", dto.getName());
		 session.setAttribute("eamil", dto.getEmail());
		 session.setAttribute("sessPhone", dto.getPhone());
		 session.setAttribute("snsImg", dto.getSnsImg());
		 session.setAttribute("adminNy", dto.getAdminNy());
//	     httpSession.setAttribute("sessSns", dto.getSns_type());
	 }
	

}
