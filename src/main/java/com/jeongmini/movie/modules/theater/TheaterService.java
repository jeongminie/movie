package com.jeongmini.movie.modules.theater;

import java.util.List;

public interface TheaterService {
	
	public List<Theater> selectTheaterList(TheaterVO vo) throws Exception;
	
	public List<Theater> selectTheaterCity() throws Exception;

}
