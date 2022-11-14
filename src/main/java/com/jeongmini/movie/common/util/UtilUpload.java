package com.jeongmini.movie.common.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.jeongmini.movie.common.constants.Constants;
import com.jeongmini.movie.modules.member.Member;

public class UtilUpload {
	
	public static void upload (MultipartFile multipartFile, String className, Member dto) throws Exception {
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss.SSS");
		
		String fileName = multipartFile.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		String uuid = UUID.randomUUID().toString();
		String uuidFileName = uuid + "." + ext;
		String pathModule = className;
		String nowString = simpleDateFormat.format(System.currentTimeMillis());
		System.out.println(nowString);
		String pathDate = nowString.substring(0,4) + "/" + nowString.substring(5,7) + "/" + nowString.substring(8,10); 
		String path = Constants.UPLOAD_PATH_PREFIX + "/" + pathModule + "/" + pathDate + "/";
		String pathForView = Constants.UPLOAD_PATH_PREFIX_FOR_VIEW + "/" + pathModule + "/" + pathDate + "/";
		
		createPath(path);
		  
		multipartFile.transferTo(new File(path + uuidFileName));
		
		dto.setPath(pathForView);
		dto.setOriginalName(fileName);
		dto.setUuidName(uuidFileName);
		dto.setExt(ext);
		dto.setSize(multipartFile.getSize());
	}
	
	public static void createPath (String path) {
		File uploadPath = new File(path);
		
		System.out.println("uploadPath : " + uploadPath);
		
		if (!uploadPath.exists()) {
			uploadPath.mkdir();
		} else {
			// by pass
		}
	}
	
	public static void removeFile(String filePath) throws IOException {
//		String realFilePath = Constants.FILE_UPLOAD_PATH + filePath;
		
//		Path path = Paths.get(realFilePath);
		
		File file = new File(Constants.FILE_UPLOAD_PATH + filePath);
		Path test = Paths.get(Constants.FILE_UPLOAD_PATH + filePath);
		
		System.out.println("---------------------");
		System.out.println(test);
		
		Files.delete(test);

		
//		path = path.getParent(); 
//		
//		if(Files.exists(path)) {
//			try {
//				Files.delete(path);
//			} catch (IOException e) {
//				System.out.print("[FileManagerService removeFile] directory delete fail");
//				e.printStackTrace();
//			}
//		}
			
	}

}
