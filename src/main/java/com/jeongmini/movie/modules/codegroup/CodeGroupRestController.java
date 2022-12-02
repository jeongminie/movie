package com.jeongmini.movie.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CodeGroupRestController {
	@Autowired
	CodeGroupServiceImpl service;
	
	@RequestMapping(value="/oracleTest")
	public List<CodeGroup> oracleTest() throws Exception {
		List<CodeGroup> list = service.oracleTest();
		
		return list;
	}
	

}
