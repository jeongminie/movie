package com.jeongmini.movie.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/codeGroup/")
public class CodeGroupController {
	
	@Autowired
	CodeGroupServiceImpl service;
	
	@RequestMapping(value="codeGroupList")
	public String codeGroupList(Model model) throws Exception {
		
		List<CodeGroup> list = service.selectList();
		model.addAttribute("list", list); //list에 담아서 jsp에 전달
		
		return "infra/codeGroup/xdmin/codeGroupList";
		
	}

}
