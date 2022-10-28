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
	
	public List<Member> selectList(MemberVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	
	public int insert(Member dto) {
		return sqlSession.insert(namespace + ".insert", dto);
	}
	
	public int profileUploaded(Member dto) {
		return sqlSession.insert(namespace + ".profileUploaded", dto);
	}
	
	public int profileUpdated(Member dto) {
		return sqlSession.update(namespace + ".profileUpdated", dto);
	}

	public Member selectOne(Member dto) {
		return sqlSession.selectOne(namespace + ".login", dto); 
	}
	
	public Member selectOneMember(Member dto) {
		return sqlSession.selectOne(namespace + ".selectOneMember", dto); 
	}
	
	public int idCheck(MemberVo vo) {
		return sqlSession.selectOne(namespace + ".idCheck", vo);
	}
	
	public Member selectProfile(Member dto) {
		return sqlSession.selectOne(namespace + ".selectProfile", dto); 
	}
	
	
	  public int selectCountProfile(Member dto) { 
		  return sqlSession.selectOne(namespace + ".selectCountProfile", dto); 
	  }
	 

}
