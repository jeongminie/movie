package com.jeongmini.movie.modules.codegroup;

import java.text.SimpleDateFormat;
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
	public String codeGroupList(Model model, CodeGroupVo vo) throws Exception {
		
		List<CodeGroup> list = service.selectList(vo);
		model.addAttribute("list", list); //list에 담아서 jsp에 전달
		
		System.out.println("vo.getShOption()" + vo.getShOption());
		System.out.println("vo.getShValue()" + vo.getShValue());
		System.out.println("vo.getShDelNy()" + vo.getShDelNy());
		System.out.println("vo.getShDate()" + vo.getShDate());
		System.out.println(vo.getShStartDate());
		System.out.println(vo.getShEndDate());
		
		return "infra/codeGroup/xdmin/codeGroupList";
		
	}
	
	@RequestMapping(value="codeGroupView")
	public String codeGroup(Model model, CodeGroupVo vo) throws Exception {
		
		CodeGroup codeGroup = service.selectOne(vo);
		model.addAttribute("item", codeGroup);
		
		System.out.println(vo.getCgSeq());
		
		return "infra/codeGroup/xdmin/codeGroupView";
		
	}
	
	@RequestMapping(value="codeGroupRegForm")
	public String codeGroupRegForm() {
		return "infra/codeGroup/xdmin/codeGroupRegForm";
	}
	
	/*
	 * @RequestMapping(value="codeGroupView") public String codeGroupRegView() {
	 * return "infra/codeGroup/xdmin/codeGroupView"; }
	 */
	
	@RequestMapping(value="codeGroupInst")
	public String codeGroupInst(CodeGroup dto) throws Exception {
		int result = service.insert(dto);
		
		System.out.println("insert 성공 : " + result);
		
		return "redirect:/codeGroup/codeGroupList";
	}
	
	@RequestMapping(value="codeGroupUpdate")
	public String codeGroupUpdate(CodeGroup dto) throws Exception {
		int result = service.update(dto);
		
		System.out.println("update 성공 : " + result);
		
		return "redirect:/codeGroup/codeGroupList";
	}

}
