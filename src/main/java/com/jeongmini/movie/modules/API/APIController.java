package com.jeongmini.movie.modules.API;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class APIController {
	@RequestMapping(value = "/test")
	public String frequentzoneChild(Model model) throws Exception {
		
		String apiUrl = "http://apis.data.go.kr/B552061/frequentzoneChild/getRestFrequentzoneChild?serviceKey=crL6mDksUtiLZSGKt4kUoL9q7LZyzuiV%2F8MwRfBg6%2FhadC7T4BoXbiIM7BkczUUVm1KhYHMfjo2syNnoNKwReg%3D%3D&searchYearCd=2020&siDo=11&guGun=&type=json&numOfRows=10&pageNo=1";
		
		URL url = new URL(apiUrl);
		HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
		httpURLConnection.setRequestMethod("GET");
		
		BufferedReader bufferedReader;
		if (httpURLConnection.getResponseCode() >= 200 && httpURLConnection.getResponseCode() <= 300) {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
		} else {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
		}
		
		StringBuilder stringBuilder = new StringBuilder();
		String line;
		while ((line = bufferedReader.readLine()) != null) {
			System.out.println("line: " + line);
			stringBuilder.append(line);
		}

		bufferedReader.close();
		httpURLConnection.disconnect();

		System.out.println("stringBuilder.toString(): " + stringBuilder.toString());
		
//		json object + array string -> java map
		
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map = objectMapper.readValue(stringBuilder.toString(), Map.class);
        
        System.out.println("######## Map");
		for (String key : map.keySet()) {
			String value = String.valueOf(map.get(key));	// ok
			System.out.println("[key]:" + key + ", [value]:" + value);
		}
		
//		Map<String, Object> header = new HashMap<String, Object>();
//		header = (Map<String, Object>) map.get("header");
//		
//		System.out.println("######## Header");
//		for (String key : header.keySet()) {
//			String value = String.valueOf(header.get(key));	// ok
//			System.out.println("[key]:" + key + ", [value]:" + value);
//		}
		
//		String aaa = (String) header.get("resultCode");
		
//		System.out.println("header.get(\"resultCode\"): " + header.get("resultCode"));
//		System.out.println("header.get(\"resultMsg\"): " + header.get("resultMsg"));
		
		Map<String, Object> items = new HashMap<String, Object>();
		items = (Map<String, Object>) map.get("items");
		
		List<API> item = new ArrayList<API>();
		item = (List<API>) items.get("item");
		
//		for(API d : item) {
//			System.out.println(d.getAfos_fid());
//		}
		
//		model.addAllAttributes(header);
		model.addAllAttributes(map);
		model.addAllAttributes(items);
		
		return "infra/api/frequentzoneChild";
	}

}
