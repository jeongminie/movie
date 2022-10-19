package com.jeongmini.movie.modules.movie;

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
@RequestMapping(value="/movie/")
public class MovieController {
	
	@Autowired
	MovieServiceImpl service;
	
	@RequestMapping(value="running")
	public String runningCurrentView(Model model, MovieVO vo, HttpServletRequest request) throws Exception {
		System.out.println("검색어 : " + vo.getShMovieNm());
		
		HttpSession session = request.getSession();
		
		if((Integer)session.getAttribute("sessSeq") != null) {
			vo.setUserSeq((Integer)session.getAttribute("sessSeq"));
		}
		
		List<Movie> list = service.selectRunning(vo);
		model.addAttribute("list", list);
		
		return "infra/movie/user/running";
	}
	
	@RequestMapping(value="premovie")
	public String boxofficeView(Model model, MovieVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		if((Integer)session.getAttribute("sessSeq") != null) {
			vo.setUserSeq((Integer)session.getAttribute("sessSeq"));
		}
		
		List<Movie> list = service.selectPremovie(vo);
		model.addAttribute("list", list);
		
		return "infra/movie/user/premovie";
	}
	
	@RequestMapping(value="openAlarm")
	public String openAlarmView(Model model, MovieVO vo) throws Exception {
		Movie movie = service.selectMovie(vo);
		
		model.addAttribute("item", movie);
		
		System.out.println(vo.getMovieCode());
		
		return "infra/movie/user/openAlarm";
	}
	
	
	@RequestMapping(value="boxofficeApi")
	public String boxOfficeXdminView(Model model) throws Exception {
//		List<Movie> list = service.selectList();
//		
//		model.addAttribute("list", list);
		
		return "infra/movie/xdmin/boxOfficeAPI";
	}
	
	@RequestMapping(value="boxofficeUpdate")
	@ResponseBody
	public Map<String, String> boxofficeUpdate(Movie dto) throws Exception {
		
		Map<String, String> result = new HashMap<>();
		
		if(service.boxofficeUpdate(dto)) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@RequestMapping(value="likeProc")
	@ResponseBody
	public Map<String, Object> likeProc(MovieVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int userSeq = (Integer)session.getAttribute("sessSeq");
		vo.setUserSeq(userSeq);
		
		Map<String, Object> result = new HashMap<>();
		
		boolean like = service.movieLike(vo);
		boolean existLike = service.existLike(vo);
		result.put("like", like);
		result.put("existLike", existLike);
		
		return result;
		
	}
	
}
