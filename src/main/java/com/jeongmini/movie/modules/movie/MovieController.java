package com.jeongmini.movie.modules.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public String runningCurrentView(Model model) throws Exception {
		List<Movie> list = service.selectRunning();
		
		model.addAttribute("list", list);
		
		return "infra/movie/user/running";
	}
	
	@RequestMapping(value="premovie")
	public String boxofficeView(Model model) throws Exception {
List<Movie> list = service.selectPremovie();
		
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
	
	@RequestMapping(value="test.do")
	@ResponseBody
	public String test(MovieVO vo) throws Exception {
		System.out.println("넘어옸나");
		
		return "infra/movie/user/time"; 
	}
	

}
