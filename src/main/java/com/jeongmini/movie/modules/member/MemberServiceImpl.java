package com.jeongmini.movie.modules.member;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeongmini.movie.common.util.EncryptUtils;

@Service
public class MemberServiceImpl implements MemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemberDAO dao;
	
	@Override
	public List<Member> selectList() throws Exception {
		return dao.selectList();
	}
	
	@Override
	public int insert(Member dto) throws Exception {
		String encryptPassword = EncryptUtils.md5(dto.getPassword());
		dto.setPassword(encryptPassword);
		
		if(encryptPassword.equals("")) {
			logger.error("[UserBO signUP]암호화 실패");
			return 0;
		}
		
		return dao.insert(dto);
	}
	
	@Override
	public Member login(Member dto) throws Exception {
		String encryptPassword = EncryptUtils.md5(dto.getPassword());
		dto.setPassword(encryptPassword);
		
		return dao.selectOne(dto);
	}
	
	@Override
	public boolean idCheck(MemberVo vo) throws Exception {
		if(dao.idCheck(vo) == 0) {
			return false;
		} else {
			return true;
		}
	}

}
