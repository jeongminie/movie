package com.jeongmini.movie.modules.code;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeongmini.movie.modules.codegroup.CodeGroup;

@Repository
public class CodeDao {
	//하나의 서비스에 여러개의 데이터베이스가 붙기위한 선언부
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.jeongmini.movie.modules.code.CodeMapper";
	
	public List<Code> selectList(CodeVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	
	public Code selectOne(CodeVo vo){ return sqlSession.selectOne(namespace + ".selectOne", vo); }
	
	public int selectOneCount(CodeVo vo) { return sqlSession.selectOne(namespace + ".selectOneCount", vo); }
	
	public List<Code> emailSelectList(){ return sqlSession.selectList(namespace + ".emailSelectList", ""); }
	
	public int insert(Code dto) { return sqlSession.insert(namespace + ".insert", dto); }
	
	public int update(Code dto) { return sqlSession.update(namespace + ".update", dto); }
	
	public int uelete(CodeVo vo) { return sqlSession.update(namespace + ".uelete", vo); }
	
	public int delete(CodeVo vo) { return sqlSession.update(namespace + ".delete", vo); }

	//	for cache
	public List<Code> selectListCachedCodeArrayList(){ return sqlSession.selectList(namespace + ".selectListCachedCodeArrayList", null); }
}
