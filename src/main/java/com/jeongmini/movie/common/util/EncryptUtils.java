package com.jeongmini.movie.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtils {
	
	public static String md5(String message) {
		String encData = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bytes = message.getBytes(); 
			md.update(bytes);
			byte[] digest = md.digest();
			
			for(int i = 0; i < digest.length; i++) {
				encData += Integer.toHexString(digest[i]&0xff);
			}
					
		} catch (NoSuchAlgorithmException e) {
			
			e.printStackTrace();
		}
		
		return encData;
	}

}

//sha-256 방식
/*
 * public class UtilSecurity {
 * 
 * public static String encryptSha256(String text) throws
 * NoSuchAlgorithmException { MessageDigest md =
 * MessageDigest.getInstance("SHA-256"); md.update(text.getBytes());
 * 
 * return bytesToHex(md.digest()); }
 * 
 * private static String bytesToHex(byte[] bytes) { StringBuilder builder = new
 * StringBuilder(); for (byte b : bytes) { builder.append(String.format("%02x",
 * b)); } return builder.toString(); }
 * 
 * }
 */
