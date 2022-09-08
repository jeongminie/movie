package com.jeongmini.movie.modules.code;

import java.util.List;

public interface CodeService {

	//인터페이스에선 함수이름만 정의
	public List<Code> selectList(CodeVo vo) throws Exception;
	
	public List<Code> emailSelectList() throws Exception;
	
	public int insert(Code dto) throws Exception;
}
