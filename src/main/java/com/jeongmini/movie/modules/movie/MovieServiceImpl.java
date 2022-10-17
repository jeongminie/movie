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
	public List<Movie> selectPremovie() throws Exception {
		List<Movie> list = dao.selectPremovie();

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
	
	@Override
	public boolean existLike(MovieVO vo) {
		int count = dao.selectCountLike(vo);
		System.out.println(count);
		
		if(count >= 1) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean movieLike(MovieVO vo) throws Exception {
		if(this.existLike(vo)) {
			dao.movieLikeDel(vo);	
			return false;
		} else {
			dao.movieLikeInst(vo);
			return true;
		}
	}
	
	@Override
	public int totalCountLike(MovieVO vo) throws Exception {
		
		return dao.selectTotalCountLike(vo);
	}
	
}
