package org.mohang.controller;

import org.mohang.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController{
	@Autowired
	NoticeService service;
	@GetMapping("/notice")
	public String notice(Model model){
	model.addAttribute("notice", service.getNotice());
	return "/module/notice/notice";
	}

}