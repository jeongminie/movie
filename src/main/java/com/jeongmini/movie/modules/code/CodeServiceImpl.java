package com.jeongmini.movie.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeServiceImpl implements CodeService {
	//CodeGroupService는 인터페이스로 아무 역할을 못함 여기서 상속받아서 함수 사용
	
	@Autowired
	CodeDao dao;
	
	@Override
	public List<Code> selectList(CodeVo vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public int selectOneCount(CodeVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	
	@Override
	public List<Code> emailSelectList() throws Exception {
		return dao.emailSelectList();
	}
	
	@Override
	public int insert(Code dto) throws Exception {
		return dao.insert(dto);
	}

}
