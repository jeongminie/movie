package com.jeongmini.movie.common.util;

import java.util.HashMap;

import org.json.simple.JSONObject;

import com.jeongmini.movie.common.constants.Constants;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class CoolSms {
	
    public static void singleSms(String number, String cerNum) {
    	String coolSmsApiKey = Constants.COOL_SMS_API_KEY;
    	String coolSmSapiSecret = Constants.COOL_SMS_API_SECRET;
    	
        Message coolsms = new Message(coolSmsApiKey, coolSmSapiSecret);

        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", number);
        params.put("from",  "01025116861");
        params.put("type", "SMS");
        params.put("text", "본인확인 인증번호는 ["+cerNum+"] 입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());

        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
    }

}
