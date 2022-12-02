package com.jeongmini.movie.modules.codegroup;

import java.util.List;

import com.jeongmini.movie.common.util.Criteria;

public interface CodeGroupService {

	//인터페이스에선 함수이름만 정의
	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception;
	public List<CodeGroup> selectList() throws Exception;
	
	public int selectBoardCount(CodeGroupVo vo) throws Exception;
	public int selectBoardTotalCount(CodeGroupVo vo) throws Exception;
	
	public CodeGroup selectOne(CodeGroupVo vo) throws Exception;
	
	public int insert(CodeGroup dto) throws Exception;
	
	public int update(CodeGroup dto) throws Exception;
	
	public boolean uelete(CodeGroupVo vo) throws Exception;
	
	public boolean delete(CodeGroupVo vo) throws Exception;
	
	public List<CodeGroup> oracleTest() throws Exception;
	
}
