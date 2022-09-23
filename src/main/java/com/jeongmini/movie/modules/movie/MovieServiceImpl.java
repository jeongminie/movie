package com.jeongmini.movie.modules.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	MovieDAO dao;
	
	@Override
	public List<Movie> selectRunning() throws Exception {
		List<Movie> list = dao.selectRunning();

		return list;
	}
	
	@Override
	public Movie selectMovie(MovieVO vo) throws Exception {
		Movie movie = dao.selectMovie(vo);
		
		return movie;
	}
	
	@Override
	public List<Movie> selectBoxofficeAPI() throws Exception {
		List<Movie> list = dao.selectBoxofficeAPI();

		return list;
	}
	
	@Override
	public boolean boxofficeUpdate(Movie dto) throws Exception {
		int result = dao.boxofficeUpdate(dto);
		
		if(result == 0) {
			return false;
		} else {
			return true;
		}
	}

}
