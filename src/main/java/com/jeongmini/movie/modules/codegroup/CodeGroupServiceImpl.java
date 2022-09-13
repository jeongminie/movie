package com.jeongmini.movie.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeGroupServiceImpl implements CodeGroupService {
	//CodeGroupService는 인터페이스로 아무 역할을 못함 여기서 상속받아서 함수 사용
	
	@Autowired
	CodeGroupDao dao;
	
//	@Override
//	public List<CodeGroup> selectList(CodeGroupVO vo) throws Exception {
//		return dao.selectList(vo);
//	}
	
	@Override
	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception {
		List<CodeGroup> list = dao.selectList(vo);
		return list;
	}
	
	@Override
	public CodeGroup selectOne(CodeGroupVo vo) throws Exception {
		CodeGroup codeGroup = dao.selectOne(vo);
		
		return codeGroup;
	}
	
	@Override
	public int insert(CodeGroup dto) throws Exception {
		int result = dao.insert(dto);
		
		return result;
	}
	
	@Override
	public int update(CodeGroup dto) throws Exception {
		int result = dao.update(dto);
		
		return result;
	}
	
	@Override
	public boolean uelete(CodeGroupVo vo) throws Exception {
		if(dao.uelete(vo) == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	@Override
	public boolean delete(CodeGroupVo vo) throws Exception {
		if(dao.delete(vo) == 0) {
			return false;
		} else {
			return true;
		}
	}

	

}
