package com.jeongmini.movie.modules.chat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeongmini.movie.modules.movie.MovieVO;

@Controller
public class ChatController {
	
	@Autowired
	ChatServiceImpl service;

	@RequestMapping(value="/chat/questions")
	public String chat(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		List<Chat> list = service.selectChatListFromOne((Integer)session.getAttribute("sessSeq"));
		Chat item = service.selectOneChat((Integer)session.getAttribute("sessSeq"));
		
		model.addAttribute("list", list);
		model.addAttribute("item", item);
		
		return "infra/chat/user/questions";
	}
	
	@RequestMapping(value="/admin/answer")
	public String test(HttpServletRequest request, Model model, MovieVO vo) throws Exception {
		HttpSession session = request.getSession();
		List<Chat> list = service.selectChatListFromOne((Integer)session.getAttribute("sessSeq"));
		Chat item = service.selectOneChat((Integer)session.getAttribute("sessSeq"));
		
		model.addAttribute("list", list);
		model.addAttribute("item", item);
		
		return "infra/chat/xdmin/answer";
	}

	@ResponseBody
	@RequestMapping(value="/chat/insChat")
	public Map<String,Object> insChat(HttpServletRequest request,Chat dto) throws Exception {
		HttpSession session = request.getSession();
		Map<String,Object> result = new HashMap<String,Object>();
		
		Chat item = service.selectOneChat((Integer)session.getAttribute("sessSeq"));
		
		if(item == null) {
			Chat newChat = service.createChat((Integer)session.getAttribute("sessSeq"));
			
			if(newChat != null) {
				result.put("rt", "success");
				result.put("newChat", newChat);
			}
			else {
				result.put("rt", "fail");
			}
		}
		
		return result;
	}
	
	
}