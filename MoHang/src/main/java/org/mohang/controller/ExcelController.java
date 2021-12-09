package org.mohang.controller;

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

//	@RequestMapping(value = "/Downloadtest", method = {RequestMethod.GET, RequestMethod.POST} ,produces = { MediaType.TEXT_PLAIN_VALUE }, consumes = "application/json")
//	public void test(HttpServletResponse res, @RequestBody List<ExcelDTO> excelUriList) throws Exception {
//		String test = excelUriList.get(0).getUrl();
//		String test1 = excelUriList.get(1).getUrl();
//		String test2 = excelUriList.get(2).getUrl();
//		log.info("@@@@@@@@@2 excel : " + test);
//		log.info("@@@@@@@@@2 excel : " + test1);
//		log.info("@@@@@@@@@2 excel : " + test2);
//		service.downloadExcel(res,excelUriList);
//	}
	
	
	@RequestMapping(value = "/Downloadtest",method = {RequestMethod.POST} ,produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<List<ExcelDTO>> test(@RequestBody List<ExcelDTO> excelUriList) throws Exception {
		
		String test2 = excelUriList.get(2).getUrl();
		log.info("@@@@@@@@@2 excel : " + test2);
		
		return new ResponseEntity<>(excelUriList, HttpStatus.OK);
	}
	
	@GetMapping("/Downloadtest/OK")
	public void test1(HttpServletResponse res,@RequestBody List<ExcelDTO> excelUriList) throws Exception {
		service.downloadExcel(res, excelUriList);
		log.info("get OK");
	}
	
	
}
