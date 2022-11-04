package com.jeongmini.movie.modules.code;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

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
	
	@PostConstruct
	public void selectListCachedCodeArrayList() throws Exception {
		List<Code> codeListFromDb = (ArrayList<Code>) dao.selectListCachedCodeArrayList();
//		codeListFromDb = (ArrayList<Code>) dao.selectListCachedCodeArrayList();
		Code.cachedCodeArrayList.clear(); 
		Code.cachedCodeArrayList.addAll(codeListFromDb);
		System.out.println("cachedCodeArrayList: " + Code.cachedCodeArrayList.size() + " chached !");
	}
	
	public static List<Code> selectListCachedCode(String cgSeq) throws Exception {
		List<Code> rt = new ArrayList<Code>();
		for(Code codeRow : Code.cachedCodeArrayList) {
			if (codeRow.getCgSeq().equals(cgSeq)) {
				System.out.println("codeRow : " + codeRow.toString());
				rt.add(codeRow);
			} else {
				// by pass
			}
		}
		System.out.println("cgSeq : " + cgSeq);
		return rt;
	}
	
	public static String selectOneCachedCode(int code) throws Exception {
		String rt = "";
		for(Code codeRow : Code.cachedCodeArrayList) {
			if (codeRow.getSeq().equals(Integer.toString(code))) {
				rt = codeRow.getCcName();
			} else {
				// by pass
			}
		}
		return rt;
	}

}
