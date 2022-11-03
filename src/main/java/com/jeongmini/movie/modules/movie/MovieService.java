package com.jeongmini.movie.modules.movie;

import java.util.List;

public interface MovieService {
	
	public List<Movie> selectRunning(MovieVO vo) throws Exception;
	
	public List<Movie> selectPremovie(MovieVO vo) throws Exception;
	
	public Movie selectMovie(MovieVO vo) throws Exception;
	
	public List<Movie> selectBoxofficeAPI() throws Exception;
	
	public boolean boxofficeUpdate(Movie dto) throws Exception;
	
	public boolean existLike(MovieVO vo) throws Exception;
	
	public boolean existLikeDelN(MovieVO vo) throws Exception;
	
	public boolean movieLike(MovieVO vo) throws Exception;
	
	public int totalCountLike(MovieVO vo) throws Exception;
	
	public int movieOpenAlarm(Movie dto) throws Exception;
	
	public List<Movie> selectOpenAlarm(MovieVO vo) throws Exception;
	
	
	
}
