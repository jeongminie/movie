package com.jeongmini.movie.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeongmini.movie.modules.codegroup.CodeGroup;
import com.jeongmini.movie.modules.codegroup.CodeGroupVo;

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
	public Code selectOne(CodeVo vo) throws Exception {
		return dao.selectOne(vo);
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
	
	@Override
	public int update(Code dto) throws Exception {
		int result = dao.update(dto);
		
		return result;
	}
	
	@Override
	public boolean delete(CodeVo vo) throws Exception {
		if(dao.delete(vo) == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	@Override
	public boolean uelete(CodeVo vo) throws Exception {
		if(dao.uelete(vo) == 0) {
			return false;
		} else {
			return true;
		}
	}

}
