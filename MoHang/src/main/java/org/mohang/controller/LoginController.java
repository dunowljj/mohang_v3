package org.mohang.controller;

import org.mohang.domain.MemberVO;
import org.mohang.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/login/*")
@Log4j
public class LoginController{
	@Autowired
	private MemberService memberservice;
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void getJoin(){
		log.info("회원가입페이지");
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String postJoin(MemberVO member) throws Exception{
		log.info("회원가입 진입");
		memberservice.memberJoin(member);
		log.info("회원가입성공");
		return "/Main";
	}
	
	
	
	
	
	
	@GetMapping("/login")
	public String login(){
	
	return "/module/login/login";
	}
	
	/*@PostMapping("/login")
	public String login(){
		
	
	}*/
}