package com.jeongmini.movie.modules.member;

import java.util.List;

import com.jeongmini.movie.modules.codegroup.CodeGroupVo;

public interface MemberService {
	
	public List<Member> selectList(MemberVo vo) throws Exception;
	
	public Member selectOne(MemberVo vo) throws Exception;
	
	public int insert(Member dto) throws Exception;
	
	public int profileUploaded(Member dto) throws Exception;
	
	public Member login(Member dto) throws Exception;
	
	public Member member(Member dto) throws Exception;
	
	public boolean idCheck(MemberVo vo) throws Exception;
	
	public Member selectProfile(Member dto) throws Exception;
	
	public int selectMemberCount(MemberVo vo) throws Exception;
	

}
