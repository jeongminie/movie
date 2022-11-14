package com.jeongmini.movie.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeongmini.movie.common.util.UtilDateTime;
import com.jeongmini.movie.modules.code.CodeServiceImpl;
import com.jeongmini.movie.modules.codegroup.CodeGroupVo;

@Controller
@RequestMapping(value= "/admin/")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value="memberList")
	public String memberList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
//		vo.setParamsPaging(service.selectMemberCount(vo));
//		
//		List<Member> list = service.selectList(vo);
//		model.addAttribute("list", list);
//		
//		int shTotal = service.selectMemberCount(vo);
//		model.addAttribute("shTotal", shTotal);
//		
//		System.out.println("vo.getShValue() : " + vo.getShValue());
//		System.out.println("vo.getSeq() : " + vo.getSeq());
		
		return "infra/member/xdmin/memberList";
		
	}
	
	@RequestMapping(value="memberLita")
	public String memberLita(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		vo.setParamsPaging(service.selectMemberCount(vo));
		
		List<Member> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		int shTotal = service.selectMemberCount(vo);
		model.addAttribute("shTotal", shTotal);
		
		System.out.println("vo.getShValue() : " + vo.getShValue());
		System.out.println("vo.getSeq() : " + vo.getSeq());
		
		return "infra/member/xdmin/memberLita";
		
	}
	
	@RequestMapping(value="memberInst")
	public String signup(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		int result = service.insert(dto);
		
		System.out.println("------------------" + dto.getSeq());
		vo.setSeq(dto.getSeq());
		
		//vo 파라미터 리다이렉트 경로로 전달
		redirectAttributes.addFlashAttribute("vo", vo);
		
		if(result == 0) {
			System.out.println("insert 실패 : " + result);
		} else {
			System.out.println("insert 성공 : " + result);
		}

		return "redirect:/admin/memberRegForm"; 
	}
	
	@RequestMapping(value="memberRegForm")
	public String memberRegForm(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		Member member = service.selectOne(vo);
		model.addAttribute("item", member);
		
		return "infra/member/xdmin/memberRegForm";
	}
	
	//관리자 화면
	@RequestMapping(value="login")
	public String xdminLoginView() throws Exception {
		
		return "infra/member/xdmin/loginForm";
	}
	
	
	@RequestMapping(value="loginProc")
	public String login(Member dto, MemberVo vo, Model model, HttpServletRequest request) throws Exception {
		Member member = service.login(dto);
		
		if(member != null) {
			logger.info("로그인성공 login ID : " + member.getLoginId() + " user name : " + member.getName());
			
			HttpSession session = request.getSession();
			
			session.setAttribute("sessSeq", member.getSeq());
			session.setAttribute("loginId", member.getLoginId());
			session.setAttribute("name", member.getName());
			session.setAttribute("adminNy", member.getAdminNy());
			
		} else {
			logger.info("로그인 실패 ");
		}
		
		return "redirect:../code/codeList";
	}
	
	@RequestMapping(value="adminDelete")
	@ResponseBody
	public Map<String, Boolean> memberDelete(MemberVo vo) throws Exception {
		Map<String, Boolean> result = new HashMap<>(); 
		
		if(service.delete(vo)) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		System.out.println("delete : " + result);
		
		return result;
	}
	
	@RequestMapping(value="adminUelete")
	@ResponseBody
	public Map<String, Boolean> memberUelete(MemberVo vo) throws Exception {
		Map<String, Boolean> result = new HashMap<>(); 
		
		if(service.uelete(vo)) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		System.out.println("uelete : " + result);
		
		return result;
		
	}	
	
	
	@RequestMapping("excelDownload")
    public void excelDownload(MemberVo vo, HttpServletResponse httpServletResponse) throws Exception {
		
//		setSearch(vo);
		vo.setParamsPaging(service.selectMemberCount(vo));

		if (vo.getTotalRows() > 0) {
			List<Member> list = service.selectList(vo);
			
//			Workbook workbook = new HSSFWorkbook();	// for xls
	        Workbook workbook = new XSSFWorkbook();
	        Sheet sheet = workbook.createSheet("Sheet1");
	        CellStyle cellStyle = workbook.createCellStyle();        
	        Row row = null;
	        Cell cell = null;
	        int rowNum = 0;
			
//	        each column width setting	        
	        sheet.setColumnWidth(0, 2100);
	        sheet.setColumnWidth(1, 3100);

//	        Header
	        String[] tableHeader = {"Seq", "이름", "아이디", "성별", "생일", "이메일", "모바일", "등록일", "수정일"};

	        row = sheet.createRow(rowNum++);
	        
			for(int i=0; i<tableHeader.length; i++) {
				cell = row.createCell(i);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
				cell.setCellValue(tableHeader[i]);
			}

//	        Body
	        for (int i=0; i<list.size(); i++) {
	            row = sheet.createRow(rowNum++);
	            
//	            String type: null 전달 되어도 ok
//	            int, date type: null 시 오류 발생 하므로 null check
//	            String type 이지만 정수형 데이터가 전체인 seq 의 경우 캐스팅	            
	            
	            cell = row.createCell(0);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getSeq());
	            
	            cell = row.createCell(1);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getName());
	        	
	            cell = row.createCell(2);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getLoginId());
	        	
	            cell = row.createCell(3);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	            if(list.get(i).getGender() != null) cell.setCellValue(CodeServiceImpl.selectOneCachedCode(list.get(i).getGender()));
	            
	            cell = row.createCell(4);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getBirth());
	            
	            cell = row.createCell(5);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getEmailFull());
	            
	            cell = row.createCell(6);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getPhone());    
	            
	            cell = row.createCell(7);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	if(list.get(i).getCreatedAt() != null) cell.setCellValue(UtilDateTime.dateTimeToString(list.get(i).getCreatedAt()));
	            
	            cell = row.createCell(8);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            if(list.get(i).getUpdatedAt() != null) cell.setCellValue(UtilDateTime.dateTimeToString(list.get(i).getUpdatedAt()));
	        }

	        httpServletResponse.setContentType("ms-vnd/excel");
//	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");	// for xls
	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

	        workbook.write(httpServletResponse.getOutputStream());
	        workbook.close();
		}
    }
}
