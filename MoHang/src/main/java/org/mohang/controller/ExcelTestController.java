package org.mohang.controller;

import javax.servlet.http.HttpServletResponse;

import org.mohang.service.ExcelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/")
public class ExcelTestController {

	@Autowired
	ExcelService service;
	
	@GetMapping("test")
	public void test(HttpServletResponse res) throws Exception {
		service.downloadExcel(res);
	}
}
