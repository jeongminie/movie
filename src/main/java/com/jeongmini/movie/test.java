package com.jeongmini.movie;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class test {
	
    public void singleSms(String number) {
    	String coolSmsApiKey = "NCSRFMHDTQYIKPZP";
    	String coolSmSapiSecret = "PXNQNRPPTFIG6HTWL6XOH5GTC34SKDLV";
        Message coolsms = new Message(coolSmsApiKey, coolSmSapiSecret);

        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", number);
        params.put("from",  "01025116861");
        params.put("type", "SMS");
        params.put("text", "Coolsms Testing Message!");
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
