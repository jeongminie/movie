package com.jeongmini.movie.modules.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TheaterServiceImpl implements TheaterService {
	
	@Autowired
	TheaterDAO dao;
	
	@Override
	public List<Theater> selectTheaterList(TheaterVO vo) throws Exception {
		return dao.selectTheaterList(vo);
	}
	
	@Override
	public List<Theater> selectTheaterCity() throws Exception {
		return dao.selectTheaterCity();
	}

}
