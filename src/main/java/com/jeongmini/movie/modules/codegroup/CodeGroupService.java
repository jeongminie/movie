package com.jeongmini.movie.modules.codegroup;

import java.util.List;

public interface CodeGroupService {
	
	//인터페이스에선 함수이름만 정의
	public List<CodeGroup> selectList() throws Exception;

}
