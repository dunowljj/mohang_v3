package org.mohang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review/*")
public class ReviewController{
	@GetMapping("/review")
	public String review(){
	
	return "/module/review/review";
	}
	
	@GetMapping("/review_detail")
	public String review_detail(){
	
	return "/module/review/review_detail";
	}
	
	

}