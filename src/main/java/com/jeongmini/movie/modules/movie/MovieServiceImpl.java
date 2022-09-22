package com.jeongmini.movie.modules.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	MovieDAO dao;
	
	@Override
	public List<Movie> selectList() throws Exception {
		List<Movie> list = dao.selectList();

		return list;
	}

}
