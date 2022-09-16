package com.jeongmini.movie.modules.code;

import java.util.List;

import com.jeongmini.movie.modules.codegroup.CodeGroup;
import com.jeongmini.movie.modules.codegroup.CodeGroupVo;

public interface CodeService {

	//인터페이스에선 함수이름만 정의
	public List<Code> selectList(CodeVo vo) throws Exception;
	
	public Code selectOne(CodeVo vo) throws Exception;
	
	public int selectOneCount(CodeVo vo) throws Exception;
	
	public List<Code> emailSelectList() throws Exception;
	
	public int insert(Code dto) throws Exception;
	
	public int update(Code dto) throws Exception;
	
	public boolean uelete(CodeVo vo) throws Exception;
	
	public boolean delete(CodeVo vo) throws Exception;
}
