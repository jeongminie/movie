package com.jeongmini.movie;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeongmini.movie.modules.movie.Movie;
import com.jeongmini.movie.modules.movie.MovieServiceImpl;

@Controller

public class HomeController {
	@Autowired
	MovieServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("jm Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}
	
	@RequestMapping(value = "/")
	public String main(Model model) throws Exception {
		List<Movie> list = service.selectBoxofficeAPI();
		model.addAttribute("list", list);
		System.out.println(list);
		
		return "infra/movie/user/home";
	}

	@RequestMapping(value = "/codeGroupList", method = RequestMethod.GET)
	public String codeGroupList() {
		
		return "code/codeGroupList";
	}
}