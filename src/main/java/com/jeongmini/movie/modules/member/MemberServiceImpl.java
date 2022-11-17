package com.jeongmini.movie.modules.member;

import java.io.File;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jeongmini.movie.common.constants.Constants;
import com.jeongmini.movie.common.util.EncryptUtils;
import com.jeongmini.movie.common.util.UtilUpload;
import com.jeongmini.movie.modules.codegroup.CodeGroupVo;

@Service
public class MemberServiceImpl implements MemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemberDAO dao;
	
	@Override
	public List<Member> selectList(MemberVo vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public Member selectOne(MemberVo vo) throws Exception {
		return dao.selectOne(vo);
	}
	
	@Override
	public int insert(Member dto) throws Exception {
		String encryptPassword = EncryptUtils.md5(dto.getPassword());
		dto.setPassword(encryptPassword);
		
		if(encryptPassword.equals("")) {
			logger.error("[UserBO signUP]암호화 실패");
			return 0;
		}
		
		return dao.insert(dto);
	}
	
	@Override
	public int kakaoInsert(Member dto) throws Exception {
		return dao.kakaoInsert(dto);
	}
	
	@Override
	public int naverInsert(Member dto) throws Exception {
		return dao.naverInsert(dto);
	}
	
	@Override
	public int update(Member dto) throws Exception {
		String encryptPassword = EncryptUtils.md5(dto.getPwnow());
		
		if(dto.getPwnew() != "" && dto.getPwnew() != null) {
			String encryptPassword2 = EncryptUtils.md5(dto.getPwnew());
			dto.setPwnew(encryptPassword2);
		}
		
		dto.setPwnow(encryptPassword);
		
		return dao.update(dto);
	}
	
	@Override
	public Member login(Member dto) throws Exception {
		String encryptPassword = EncryptUtils.md5(dto.getPassword());
		dto.setPassword(encryptPassword);
		
		return dao.login(dto);
	}
	
	@Override
	public Member snsLoginCheck(Member dto) throws Exception {
		return dao.snsLoginCheck(dto);
	}
	
	@Override
	public Member member(Member dto) throws Exception {
		
		return dao.selectOneMember(dto);
	}
	
	@Override
	public boolean idCheck(MemberVo vo) throws Exception {
		if(dao.idCheck(vo) == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	@Override
	public int profileUploaded(Member dto) throws Exception{
		System.out.println(dto.getProfileUploaded());
		
		int count = dao.selectCountProfile(dto); 
		System.out.println(count);
		 
		int j = 0;
		
    	for(MultipartFile multipartFile : dto.getProfileUploaded()) {
    		if(!multipartFile.isEmpty()) {

    			String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
    			System.out.println("pathModule : " + pathModule);
	    		UtilUpload.upload(multipartFile, pathModule, dto);
	    		
	    		dto.setTableName("memberUploaded");
	    		dto.setType(1);
	    		dto.setDefaultNy(j == 0 ? 1 : 0);
	    		dto.setSort(j + 1);
	    		
	    		if(count == 0) {
	    			dao.profileUploaded(dto);
	    		} else {
	    			UtilUpload.removeFile(dto.getFilePath());
	    			dao.profileUpdated(dto);
	    		}
	    		
				j++;
    		}
    	}
    	
    	return 1;
	}
	
	@Override
	public Member selectProfile(Member dto) throws Exception {
		return dao.selectProfile(dto);
	}
	
	@Override
	public int selectMemberCount(MemberVo vo) throws Exception {
		return dao.selectMemberCount(vo);
	}
	
	@Override
	public boolean uelete(MemberVo vo) throws Exception {
		if(dao.uelete(vo) == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	@Override
	public boolean delete(MemberVo vo) throws Exception {
		if(dao.delete(vo) == 0) {
			return false;
		} else {
			return true;
		}
	}

}
