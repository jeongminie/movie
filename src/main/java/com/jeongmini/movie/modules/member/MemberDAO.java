package com.jeongmini.movie.modules.member;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeongmini.movie.modules.codegroup.CodeGroupVo;
import com.jeongmini.movie.modules.movie.Movie;

@Repository
public class MemberDAO {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.jeongmini.movie.modules.member.MemberMapper";
	
	public List<Member> selectList(MemberVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	
	public Member selectOne(MemberVo vo){ return sqlSession.selectOne(namespace + ".selectOneMember", vo); }
	
	public int insert(Member dto) {
		return sqlSession.insert(namespace + ".insert", dto);
	}
	
	public int kakaoInsert(Member dto) {
		return sqlSession.insert(namespace + ".kakaoInsert", dto);
	}
	
	public int naverInsert(Member dto) {
		return sqlSession.insert(namespace + ".naverInsert", dto);
	}
	
	public int update(Member dto) {
		return sqlSession.update(namespace + ".update", dto);
	}
	
	public int profileUploaded(Member dto) {
		return sqlSession.insert(namespace + ".profileUploaded", dto);
	}
	
	public int profileUpdated(Member dto) {
		return sqlSession.update(namespace + ".profileUpdated", dto);
	}

	public Member login(Member dto) {
		return sqlSession.selectOne(namespace + ".login", dto); 
	}
	
	public Member snsLoginCheck(Member dto) {
		return sqlSession.selectOne(namespace + ".snsLoginCheck", dto); 
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
  
	public int selectMemberCount(MemberVo vo) {
		return (Integer) sqlSession.selectOne(namespace + ".selectMemberCount", vo);
	}
	
	public int uelete(MemberVo vo) {
		int result = sqlSession.update(namespace + ".uelete", vo);
		return result;
	}
	
	public int delete(MemberVo vo) {
		int result = sqlSession.delete(namespace + ".delete", vo);
		return result;
	}
	
}
