package org.mohang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.annotation.ModelAndViewResolver;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Controller
@Data
@Log4j
@RequestMapping("/chat/*")
public class ChatController{
	
	@GetMapping("/Form")
	public String Form() {
		log.info("Form Success");
		
		return "module/chat/chatForm";
	}
	
	
	@GetMapping("/test")
	public ModelAndView test() {
		log.info("Client Success");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", "Spring and Node");
		mav.setViewName("module/chat/chat");
		
		return mav;
	}
}