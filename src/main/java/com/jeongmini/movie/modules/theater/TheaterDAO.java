package com.jeongmini.movie.modules.theater;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeongmini.movie.modules.member.Member;

@Repository
public class TheaterDAO {
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.jeongmini.movie.modules.theater.TheaterMapper";
	
	public List<Theater> selectTheaterList(){ return sqlSession.selectList(namespace + ".selectTheaterList", ""); }

}
