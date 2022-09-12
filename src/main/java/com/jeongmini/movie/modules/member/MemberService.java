package com.jeongmini.movie.modules.member;

import java.util.List;

public interface MemberService {
	
	public List<Member> selectList() throws Exception;
	
	public int insert(MemberVo vo) throws Exception;
	
	public Member login(Member dto) throws Exception;

}
