package com.jeongmini.movie.modules.movie;

import java.util.List;

public interface MovieService {
	
	public List<Movie> selectRunning() throws Exception;
	
	public List<Movie> selectPremovie() throws Exception;
	
	public Movie selectMovie(MovieVO vo) throws Exception;
	
	public List<Movie> selectBoxofficeAPI() throws Exception;
	
	public boolean boxofficeUpdate(Movie dto) throws Exception;
	
	public boolean existLike(MovieVO vo) throws Exception;
	
	public boolean movieLike(MovieVO vo) throws Exception;
	
	public int totalCountLike(MovieVO vo) throws Exception;
	
	
}
