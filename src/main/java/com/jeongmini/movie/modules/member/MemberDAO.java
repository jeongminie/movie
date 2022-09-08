package com.jeongmini.movie.modules.member;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.jeongmini.movie.modules.member.MemberMapper";
	
	public List<Member> selectList(){ return sqlSession.selectList(namespace + ".selectList", ""); }
	
	public int insert(Member dto) {
		return sqlSession.insert(namespace + ".insert", dto);
	}

}
