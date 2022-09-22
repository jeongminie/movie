package com.jeongmini.movie.modules.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/movie/")
public class MovieController {
	
	@Autowired
	MovieServiceImpl service;
	
	@RequestMapping(value="current")
	public String runningCurrentView(Model model) throws Exception {
		List<Movie> list = service.selectList();
		
		model.addAttribute("list", list);
		
		return "infra/movie/user/runningCurrent";
	}
	
	@RequestMapping(value="boxofficeApi")
	public String boxOfficeXdminView(Model model) throws Exception {
//		List<Movie> list = service.selectList();
//		
//		model.addAttribute("list", list);
		
		return "infra/movie/xdmin/boxOffice";
	}

}
