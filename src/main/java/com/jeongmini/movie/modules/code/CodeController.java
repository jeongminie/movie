package com.jeongmini.movie.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeongmini.movie.modules.codegroup.CodeGroup;
import com.jeongmini.movie.modules.codegroup.CodeGroupServiceImpl;
import com.jeongmini.movie.modules.codegroup.CodeGroupVo;

@Controller
@RequestMapping(value="/code/")
public class CodeController {
	
	@Autowired
	CodeServiceImpl service;
	
	@Autowired
	CodeGroupServiceImpl codeGroupServiceImpl;
	
	@RequestMapping(value="codeList")
	public String codeGroupList(@ModelAttribute("vo") CodeVo vo, Model model) throws Exception {
		vo.setParamsPaging(service.selectOneCount(vo));
		
		List<Code> list = service.selectList(vo);
		model.addAttribute("list", list); //list에 담아서 jsp에 전달
		
		System.out.println(vo.getShValue());
		System.out.println(vo.getShOption());
		System.out.println(vo.getShDelNy());
		System.out.println("vo.getShDate()" + vo.getShDate());
		System.out.println(vo.getShStartDate());
		System.out.println(vo.getShEndDate());
		
		return "infra/code/xdmin/codeList";
	}
	
	@RequestMapping(value="codeRegForm")
	public String codeGroupRegView(Model model, CodeGroupVo vo) throws Exception {
		List<CodeGroup> list = codeGroupServiceImpl.selectList();
		model.addAttribute("list", list);
		
		return "infra/code/xdmin/codeRegForm";
	}
	
	@RequestMapping(value="codeInst")
	public String codeGroupInst(Code dto) throws Exception {
		int result = service.insert(dto);
		
		System.out.println("insert 성공 : " + result);
		
		return "redirect:/code/codeList";
	}

}
