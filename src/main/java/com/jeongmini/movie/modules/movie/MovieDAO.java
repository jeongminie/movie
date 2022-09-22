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
	
	public List<Movie> selectList() {
		List<Movie> list = sqlSession.selectList(namespace + ".selectList", "");
		return list;
	}

}
