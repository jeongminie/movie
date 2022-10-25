package com.jeongmini.movie.modules.member;

import java.util.List;

public interface MemberService {
	
	public List<Member> selectList() throws Exception;
	
	public int insert(Member dto) throws Exception;
	
	public int profileUploaded(Member dto) throws Exception;
	
	public Member login(Member dto) throws Exception;
	
	public Member member(Member dto) throws Exception;
	
	public boolean idCheck(MemberVo vo) throws Exception;
	
	public Member selectProfile(Member dto) throws Exception;
	

}
