package com.jeongmini.movie.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/code/")
public class CodeController {
	
	@Autowired
	CodeServiceImpl service;
	
	@RequestMapping(value="codeList")
	public String codeGroupList(Model model) throws Exception {
		
		List<Code> list = service.selectList();
		model.addAttribute("list", list); //list에 담아서 jsp에 전달
		
		return "infra/code/xdmin/codeList";
		
	}

}
