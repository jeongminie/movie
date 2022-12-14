package com.jeongmini.movie.modules.movie;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeongmini.movie.modules.member.MemberVo;

@Repository
public class MovieDAO {
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.jeongmini.movie.modules.movie.MovieMapper";
	
	public List<Movie> selectRunning(MovieVO vo) {
		List<Movie> list = sqlSession.selectList(namespace + ".selectRunning", vo);
		return list;
	}
	
	public List<Movie> selectPremovie(MovieVO vo) {
		List<Movie> list = sqlSession.selectList(namespace + ".selectPremovie", vo);
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
	
	public int selectCountLike(MovieVO vo) {
		int result = sqlSession.selectOne(namespace + ".selectCountLike", vo);
		return result;
	}
	
	public int selectLikeDely(MovieVO vo) {
		int result = sqlSession.selectOne(namespace + ".selectLikeDely", vo);
		return result;
	}
	
	public int movieLikeInst(MovieVO vo) {
		int result = sqlSession.insert(namespace + ".movieLikeInst", vo);
		return result;
	}
	
	public int updateLikeDelY(MovieVO vo) {
		int result = sqlSession.update(namespace + ".updateLikeDelY", vo);
		return result;
	}
	
	public int updateLikeDelN(MovieVO vo) {
		int result = sqlSession.update(namespace + ".updateLikeDelN", vo);
		return result;
	}
	
	public int selectTotalCountLike(MovieVO vo) {
		return sqlSession.selectOne(namespace + ".selectTotalCountLike", vo);
	}
	
	public int movieOpenAlarm(Movie dto) {
		int result = sqlSession.insert(namespace + ".movieOpenAlarm", dto);
		return result;
	}
	
	public List<Movie> selectOpenAlarm(MovieVO vo){ return sqlSession.selectList(namespace + ".selectOpenAlarm", vo); }
	
	public int selectAlarmCount(MovieVO vo){ return sqlSession.selectOne(namespace + ".selectAlarmCount", vo); }

}
