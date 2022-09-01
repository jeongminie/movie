package com.jeongmini.movie.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeServiceImpl implements CodeService {
	//CodeGroupService는 인터페이스로 아무 역할을 못함 여기서 상속받아서 함수 사용
	
	@Autowired
	CodeDAO dao;
	
	@Override
	public List<Code> selectList() throws Exception {
		return dao.selectList();
	}

}
