package org.mohang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/general/*")
public class GeneralController {
	
	
	@GetMapping("/updateInformation")
	public String getInformation(){
		
		return "module/general/informationUpdateForm";
	}
	@PostMapping("/updateInformation")
	public String updateInformation(){
		
		return "module/general/informationUpdateForm";
	}
	
	@GetMapping("/insertReserve")
	public String insertReserve(){
		log.info("insertRe");
		
		return "";
	}
	@GetMapping("/getReserve")
	public String getReserve(){
		log.info("getRe");
		
		return "";
	}
	
	@GetMapping("/reserve")
	public String reserve(){
		log.info("reserve");
		return "module/general/reserveForm";
	}
	@GetMapping("/listMyReserve")
	public String listMyReserve(){
		log.info("reserve");
		return "module/general/reserveList";
	}
	
	@GetMapping("/deleteReserve")
	public String deleteReserve(){
		log.info("delReserve");
		return "";
	}
	
	@GetMapping("/listMyReview")
	public String listMyReview(){
		log.info("MyReview");
		return "module/general/likeList";
	}

}
