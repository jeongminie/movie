package com.jeongmini.movie.modules.codegroup;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeongmini.movie.common.util.PageMaker;

@Controller
@RequestMapping(value="/codeGroup/")
public class CodeGroupController {
	
	@Autowired
	CodeGroupServiceImpl service;
	
	public String nowDate() {
		LocalDate nowDate = LocalDate.now();
		
		return nowDate.toString();
	}
	
	public String oneWeek() {
		LocalDate oneWeek = LocalDate.now().plusDays(7);
		
		return oneWeek.toString();
	}

	//검색 조건 디폴트 지정
	public void setShearch(CodeGroupVo vo) throws Exception {
		
		vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
//		vo.setShDate(vo.getShDate() == null ? 1 : vo.getShDate());
//		vo.setShOption(vo.getShOption() == null ? 2 : vo.getShOption());
//		vo.setShStartDate(vo.getShStartDate() == null || vo.getShStartDate() == "" ? nowDate() : vo.getShStartDate());
//		vo.setShEndDate(vo.getShEndDate() == null || vo.getShEndDate() == "" ? oneWeek() : vo.getShEndDate());
	}
	
	
	@RequestMapping(value="codeGroupList")
	public String codeGroupList(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception {
		vo.setParamsPaging(service.selectBoardCount(vo));
		setShearch(vo);

		List<CodeGroup> list = service.selectList(vo);

		int shTotal = service.selectBoardCount(vo);
		int total = service.selectBoardTotalCount(vo);
		
		model.addAttribute("list", list); //list에 담아서 jsp에 전달
		model.addAttribute("shTotal", shTotal);
		model.addAttribute("total", total);
		
		System.out.println("vo.getSeq() : " + vo.getSeq());
		System.out.println("vo.getShValue() : " + vo.getShValue());
		
		return "infra/codeGroup/xdmin/codeGroupList";
		
	}
	
	@RequestMapping(value="codeGroupForm")
	public String codeGroupForm(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception {
		CodeGroup codeGroup = service.selectOne(vo);
		model.addAttribute("item", codeGroup);
		
		System.out.println("vo.getSeq : " + vo.getSeq());
		System.out.println("vo.getShValue() : " + vo.getShValue());
		
		return "infra/codeGroup/xdmin/codeGroupForm";
	}
	
	/*
	 * @RequestMapping(value="codeGroupView") public String codeGroupRegView() {
	 * return "infra/codeGroup/xdmin/codeGroupView"; }
	 */
	
	@RequestMapping(value="codeGroupInst")
	public String codeGroupInst(CodeGroup dto, CodeGroupVo vo, RedirectAttributes redirectAttributes) throws Exception {
		int result = service.insert(dto);
		
		vo.setSeq(dto.getSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		
		System.out.println("vo.getSeq() : " + vo.getSeq());
		System.out.println("insert 성공 : " + result);
		
		return "redirect:/codeGroup/codeGroupForm";
	}
	
	@RequestMapping(value="codeGroupUpdate")
	public String codeGroupUpdate(CodeGroup dto, CodeGroupVo vo, RedirectAttributes redirectAttributes) throws Exception {
		int result = service.update(dto);
		
		vo.setSeq(dto.getSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		
		System.out.println("update 성공 : " + result);
		
		return "redirect:/codeGroup/codeGroupForm";
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
		
		System.out.println("delete : " + result);
		
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
		
		System.out.println("uelete : " + result);
		
		return result;
		
	}

}
