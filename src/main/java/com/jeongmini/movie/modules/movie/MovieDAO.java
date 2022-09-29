package com.jeongmini.movie.modules.movie;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MovieDAO {
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.jeongmini.movie.modules.movie.MovieMapper";
	
	public List<Movie> selectRunning() {
		List<Movie> list = sqlSession.selectList(namespace + ".selectRunning", "");
		return list;
	}
	
	public List<Movie> selectPremovie() {
		List<Movie> list = sqlSession.selectList(namespace + ".selectPremovie", "");
		return list;
	}
	
	public Movie selectMovie(MovieVO vo) {
		Movie movie = sqlSession.selectOne(namespace + ".selectMovie", vo);
		return movie;
	}
	
	public List<Movie> selectBoxofficeAPI() {
		List<Movie> list = sqlSession.selectList(namespace + ".selectBoxofficeAPI", "");
		return list;
	}
	
	public int boxofficeUpdate(Movie dto) {
		int result = sqlSession.insert(namespace + ".boxofficeUpdate", dto);
		return result;
	}

}
