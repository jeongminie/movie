package com.jeongmini.movie.modules.codegroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeongmini.movie.common.util.Criteria;

@Repository
public class CodeGroupDao {
	//하나의 서비스에 여러개의 데이터베이스가 붙기위한 선언부
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.jeongmini.movie.modules.codegroup.CodeGroupMapper";
	
	public List<CodeGroup> selectList(CodeGroupVo vo) {
		List<CodeGroup> list = sqlSession.selectList("com.jeongmini.movie.modules.codegroup.CodeGroupMapper.selectList", vo);
		return list;
	}
	
	public List<CodeGroup> selectList() {
		List<CodeGroup> list = sqlSession.selectList(namespace + ".selectList", "");
		return list;
	}
	
	public int selectBoardCount(CodeGroupVo vo) {
		return (Integer) sqlSession.selectOne(namespace + ".selectBoardCount", vo);
	}
	
	public CodeGroup selectOne(CodeGroupVo vo) {
		CodeGroup codeGroup = sqlSession.selectOne(namespace + ".selectOne", vo);
		
		return codeGroup;
	}
	
	public int insert(CodeGroup dto) {
		int result = sqlSession.insert(namespace + ".insert", dto);
		
		return result;
	}
	
	public int update(CodeGroup dto) {
		int result = sqlSession.update(namespace + ".update", dto);
		
		return result;
	}
	
	public int uelete(CodeGroupVo vo) {
		int result = sqlSession.update(namespace + ".uelete", vo);
		
		return result;
	}
	
	public int delete(CodeGroupVo vo) {
		int result = sqlSession.delete(namespace + ".delete", vo);
		
		return result;
	}
	
}
