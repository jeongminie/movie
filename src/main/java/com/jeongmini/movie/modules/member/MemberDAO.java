package com.jeongmini.movie.modules.member;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
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
	
	public int profileUploaded(Member dto) {
		return sqlSession.insert(namespace + ".profileUploaded", dto);
	}
	
	public Member selectOne(Member dto) {
		return sqlSession.selectOne(namespace + ".login", dto); 
	}
	
	public int idCheck(MemberVo vo) {
		return sqlSession.selectOne(namespace + ".idCheck", vo);
	}

}
