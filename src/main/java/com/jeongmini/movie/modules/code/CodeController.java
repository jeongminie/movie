package com.jeongmini.movie.modules.code;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeongmini.movie.common.util.PageMaker;
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
		
		System.out.println("vo.getShValue() : " + vo.getShValue());
//		System.out.println(vo.getShOption());
//		System.out.println(vo.getShDelNy());
//		System.out.println("vo.getShDate() : " + vo.getShDate());
//		System.out.println(vo.getShStartDate());
//		System.out.println(vo.getShEndDate());
		
		return "infra/code/xdmin/codeList";
	}
	
	@RequestMapping(value="codeForm")
	public String codeGroupRegView(Model model, @ModelAttribute("vo") CodeVo vo, CodeGroupVo cgVo) throws Exception {
		cgVo.setRowNumToShow(9999);
		
		List<CodeGroup> list = codeGroupServiceImpl.selectList(cgVo);
		model.addAttribute("list", list);
		
		Code code = service.selectOne(vo);
		model.addAttribute("item", code);
		
		System.out.println("vo.getStartRnumForMysql() : " + cgVo.getStartRnumForMysql());
		System.out.println("vo.getRowNumToShow() : " + cgVo.getRowNumToShow());
		System.out.println("vo.getShValue() : " + vo.getShValue());
		
		return "infra/code/xdmin/codeForm";
	}
	
	@RequestMapping(value="codeInst")
	public String codeInst(Code dto, CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		int result = service.insert(dto);
		
		vo.setSeq(dto.getSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		
		System.out.println("insert 성공 : " + result);
		
		return "redirect:/code/codeForm";
	}
	
	@RequestMapping(value="codeUpdate")
	public String codeUpdate(Code dto, CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		int result = service.update(dto);
		
		vo.setSeq(dto.getSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		
		System.out.println("update 성공 : " + result);
		
		return "redirect:/code/codeForm";
	}
	
	@RequestMapping(value="codeDelete")
	@ResponseBody
	public Map<String, Boolean> codeDelete(CodeVo vo) throws Exception {
		Map<String, Boolean> result = new HashMap<>(); 
		
		if(service.delete(vo)) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		System.out.println("delete 성공 : " + result);
		
		return result;
	}
	
	@RequestMapping(value="codeUelete")
	@ResponseBody
	public Map<String, Boolean> codeUelete(CodeVo vo) throws Exception {
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
