package org.mohang.controller;

import java.util.List;

import org.mohang.domain.NoticeVO;
import org.mohang.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;
@Log4j
@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	NoticeService service;
	@GetMapping("/Main")
	public String main(Model model){

		return "Main";
	}
}
