package com.jeongmini.movie.modules.member;

import java.util.List;

public interface MemberService {
	
	public List<Member> selectList() throws Exception;
	
	public int insert(Member dto) throws Exception;

}
