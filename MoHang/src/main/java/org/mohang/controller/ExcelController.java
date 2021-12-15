package org.mohang.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.mohang.domain.ExcelDTO;
import org.mohang.service.ExcelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonArray;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/excel/*")
@Log4j
public class ExcelController {

	@Autowired
	ExcelService service;

	@PostMapping(value = "imageDownload" ,produces = { MediaType.APPLICATION_JSON_UTF8_VALUE },
			consumes = "application/json;utf-8")
	public void test(HttpServletResponse res,@RequestBody List<ExcelDTO> excelUriList) throws Exception {
		String tempStr[] = new String[excelUriList.size()];
		for(int i = 0 ; i < excelUriList.size() ; i++) {
			tempStr[i] = excelUriList.get(i).getUrl();
		}
		
		service.saveFile(tempStr);
		
	}
	
	@GetMapping("/excelDownload")
	public void test2(HttpServletResponse res) throws Exception {
		List<File> list = service.ownloadExcel(res);
		String path = System.getProperty("user.dir"); 
		System.out.println("현재 작업 경로: " + path);

		log.info("files size: " + list.size());
	}
	
}
