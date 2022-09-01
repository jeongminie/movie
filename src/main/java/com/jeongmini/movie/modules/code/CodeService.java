package com.jeongmini.movie.modules.code;

import java.util.List;

public interface CodeService {

	//인터페이스에선 함수이름만 정의
	public List<Code> selectList() throws Exception;
}
