package com.jeongmini.movie.modules.theater;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.python.util.PythonInterpreter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping(value="movie")
@Controller
public class TheaterController {
	/*
	 * private static PythonInterpreter intPre;
	 * 
	 * @RequestMapping(value="time") public ModelAndView theatherView(Model model)
	 * throws Exception { // 컴퓨터의 현재 날짜 정보 LocalDate localDate = LocalDate.now();
	 * System.out.println(localDate);
	 * 
	 * //월 Month month = localDate.getMonth(); //일 int date =
	 * localDate.getDayOfMonth(); //요일 //DayOfWeek day = localDate.getDayOfWeek();
	 * //월 첫날 int firstDate = localDate.withDayOfMonth(1).getDayOfMonth(); //월 마지막날
	 * int lastDate =
	 * localDate.withDayOfMonth(localDate.lengthOfMonth()).getDayOfMonth();
	 * 
	 * List<String> dateList = new ArrayList<>(); List<String> dayOfWeek = new
	 * ArrayList<>();
	 * 
	 * for(int i = 0; i <= 13; i++) { LocalDate twoWeek = localDate.plusDays(i);
	 * String twoWeekStr = twoWeek.format(DateTimeFormatter.ofPattern("d"));
	 * 
	 * DayOfWeek day = twoWeek.getDayOfWeek(); String dayStr = "";
	 * 
	 * switch (day) { case SUNDAY: dayStr = "일"; break; case MONDAY: dayStr = "월";
	 * break; case TUESDAY: dayStr = "화"; break; case WEDNESDAY: dayStr = "수";
	 * break; case THURSDAY: dayStr = "목"; break; case FRIDAY: dayStr = "금"; break;
	 * case SATURDAY: dayStr = "토"; break; }
	 * 
	 * dateList.add(twoWeekStr); dayOfWeek.add(dayStr); }
	 * 
	 * model.addAttribute("dayOfWeek", dayOfWeek); model.addAttribute("dateList",
	 * dateList);
	 * 
	 * 
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * String url = "http://127.0.0.1:5000/tospring"; String sb = ""; try {
	 * HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
	 * 
	 * BufferedReader br = new BufferedReader(new
	 * InputStreamReader(conn.getInputStream(), "utf-8"));
	 * 
	 * String line = null;
	 * 
	 * while ((line = br.readLine()) != null) { sb = sb + line + "\n"; }
	 * System.out.println("========br======" + sb.toString()); if
	 * (sb.toString().contains("ok")) { System.out.println("test");
	 * 
	 * } br.close();
	 * 
	 * System.out.println(
	 * "---------------------------------------------------------------" +
	 * sb.toString()); } catch (MalformedURLException e) { e.printStackTrace(); }
	 * catch (IOException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } mav.addObject("data", sb.toString()); // "test1"는
	 * jsp파일에서 받을때 이름, //sb.toString은 value값(여기에선 test) mav.addObject("fail",
	 * false); mav.setViewName("infra/movie/user/time"); // jsp파일 이름
	 * 
	 * return mav; }
	 */
	
	@RequestMapping(value="time")
	public String theatherView(Model model) throws Exception {
		// 컴퓨터의 현재 날짜 정보
			LocalDate localDate = LocalDate.now();
			System.out.println(localDate);
			
			//월
			Month month = localDate.getMonth();
			//일
			int date = localDate.getDayOfMonth();
			//요일
			//DayOfWeek day = localDate.getDayOfWeek();
			//월 첫날
			int firstDate = localDate.withDayOfMonth(1).getDayOfMonth();
			//월 마지막날
			int lastDate = localDate.withDayOfMonth(localDate.lengthOfMonth()).getDayOfMonth();
			//2주치
//				LocalDate twoWeek = localDate.plusDays(13);
			
			System.out.println(month);
			System.out.println(firstDate);
			System.out.println(lastDate);
//				System.out.println(twoWeek.toString());
			
			List<String> dateList = new ArrayList<>();
			List<String> dayOfWeek = new ArrayList<>();

			for(int i = 0; i <= 13; i++) {
				LocalDate twoWeek = localDate.plusDays(i);
				String twoWeekStr = twoWeek.format(DateTimeFormatter.ofPattern("d"));
				
				DayOfWeek day = twoWeek.getDayOfWeek();
				String dayStr = "";
				
				switch (day) {
				case SUNDAY:
					dayStr = "일";
					break;
				case MONDAY:
					dayStr = "월";
					break;
				case TUESDAY:
					dayStr = "화";
					break;
				case WEDNESDAY:
					dayStr = "수";
					break;
				case THURSDAY:
					dayStr = "목";
					break;
				case FRIDAY:
					dayStr = "금";
					break;
				case SATURDAY:
					dayStr = "토";
					break;
				}

				dateList.add(twoWeekStr);
				dayOfWeek.add(dayStr);
				
			}

					
			model.addAttribute("dayOfWeek", dayOfWeek);
			model.addAttribute("dateList", dateList);
		
		return "infra/movie/user/time";
	}

}
