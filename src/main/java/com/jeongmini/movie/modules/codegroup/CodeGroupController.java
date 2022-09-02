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
	public String codeGroupList(Model model, CodeGroupVO vo) throws Exception {
		
		List<CodeGroup> list = service.selectList(vo);
		model.addAttribute("list", list); //list에 담아서 jsp에 전달
		
		System.out.println(vo.getShOption());
		System.out.println(vo.getShValue());
		
		return "infra/codeGroup/xdmin/codeGroupList";
		
	}

}
