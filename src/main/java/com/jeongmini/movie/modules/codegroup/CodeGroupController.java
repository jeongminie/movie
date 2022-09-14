package com.jeongmini.movie.modules.codegroup;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeongmini.movie.common.util.Criteria;
import com.jeongmini.movie.common.util.PageMaker;

@Controller
@RequestMapping(value="/codeGroup/")
public class CodeGroupController {
	
	@Autowired
	CodeGroupServiceImpl service;
	
	@RequestMapping(value="codeGroupList")
	public String codeGroupList(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception {
		List<CodeGroup> list = service.selectList(vo);
		
		PageMaker pageMaker = new PageMaker();

		int total = service.selectBoardCount(vo);
		
		pageMaker.setCodeGroupVo(vo);
		pageMaker.setTotalCount(total);
		
		model.addAttribute("list", list); //list에 담아서 jsp에 전달
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("total", total);
		
		System.out.println(pageMaker.getStartPage());
		System.out.println(pageMaker.getEndPage());
		
		return "infra/codeGroup/xdmin/codeGroupList";
		
	}
	
	@RequestMapping(value="codeGroupForm")
	public String codeGroupForm(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception {
		CodeGroup codeGroup = service.selectOne(vo);
		model.addAttribute("item", codeGroup);
		
		System.out.println("vo.getSeq : " + vo.getSeq());
		
		return "infra/codeGroup/xdmin/codeGroupForm";
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
		
		return "redirect:/codeGroup/codeGroupForm?seq="+dto.getSeq();
	}
	
	@RequestMapping(value="codeGroupDelete")
	@ResponseBody
	public Map<String, Boolean> codeGroupDelete(CodeGroupVo vo) throws Exception {
		Map<String, Boolean> result = new HashMap<>(); 
		
		if(service.delete(vo)) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		System.out.println("delete 성공 : " + result);
		
		return result;
	}
	
	@RequestMapping(value="codeGroupUelete")
	@ResponseBody
	public Map<String, Boolean> codeGroupUelete(CodeGroupVo vo) throws Exception {
		Map<String, Boolean> result = new HashMap<>(); 
		
		if(service.uelete(vo)) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		System.out.println("uelete 성공 : " + result);
		
		return result;
		
	}

}
