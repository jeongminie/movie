package com.jeongmini.movie.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO dao;
	
	@Override
	public List<Member> selectList() throws Exception {
		return dao.selectList();
	}
	
	@Override
	public int insert(MemberVo vo) throws Exception {
		return dao.insert(vo);
	}
	
	@Override
	public Member login(Member dto) throws Exception {
		return dao.selectOne(dto);
		
	}

}
