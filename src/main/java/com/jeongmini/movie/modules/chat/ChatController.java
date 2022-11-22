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

@Controller
@RequestMapping(value="/chat/")
public class ChatController {
	
	@Autowired
	ChatServiceImpl service;

	@RequestMapping(value="")
	public String chat(HttpServletRequest request,Model model) throws Exception {
		HttpSession session = request.getSession();
		List<Chat> list = service.selectChatListFromOne((Integer)session.getAttribute("sessSeq"));
		
		model.addAttribute("list", list);
		
		return "infra/chat/user/chat";
	}

	@ResponseBody
	@RequestMapping(value="insChat")
	public Map<String,Object> insChat(HttpServletRequest request,Chat dto) throws Exception {
		
		Map<String,Object> result = new HashMap<String,Object>();
		
		HttpSession session = request.getSession();
		Chat newChat = service.createChat((Integer)session.getAttribute("sessSeq"),dto.getCuMember());
		
		if(newChat != null) {
			result.put("rt", "success");
			result.put("newChat", newChat);
		}
		else
			result.put("rt", "fail");
		
		return result;
	}
}