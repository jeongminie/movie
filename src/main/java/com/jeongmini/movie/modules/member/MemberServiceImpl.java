package com.jeongmini.movie.modules.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jeongmini.movie.common.util.EncryptUtils;
import com.jeongmini.movie.common.util.UtilUpload;

@Service
public class MemberServiceImpl implements MemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemberDAO dao;
	
	@Override
	public List<Member> selectList() throws Exception {
		return dao.selectList();
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
	public Member login(Member dto) throws Exception {
		String encryptPassword = EncryptUtils.md5(dto.getPassword());
		dto.setPassword(encryptPassword);
		
		return dao.selectOne(dto);
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

				dao.profileUploaded(dto);
				j++;
    		}
    	}
    	
    	return 1;
	}

}
