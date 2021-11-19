package org.mohang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/event/*")
public class EventController  {
	
	//행사신청정보페이지
	@GetMapping("/insertForm")
	public String insertForm(){
		return "module/event/insertForm";
	}
	
	//행사신청리스트 확인페이지
	@GetMapping("/applyList")
	public String applyList(){
		return "module/event/applyList";
	}

	
	//신청한 행사정보확인페이지
	@GetMapping("/applyInsertFormShow")
	public String applyInsertFormShow(){
		return "module/event/applyInsertFormShow";
	}
	
	/*@GetMapping("/applyListDetail")
	public String applyListDetail(){
		return "module/event/applyListDetail";
	}*/
	
	//신청한 행사정보 수정페이지 
	@GetMapping("/insertFormUpdate")
	public String insertFormUpdate(){
		return "module/event/insertFormUpdate";
	}
	
	//행사정보확인페이지
	@GetMapping("/eventDetail")
	public String eventDetail(){
		return "module/event/eventDetail";
	}
	
	//행사통계자료리스트확인페이지
	@GetMapping("/statisticsList")
	public String statisticsList(){
		return "module/event/statisticsList";
	}

	//통계정보상세조회페이지
	@GetMapping("/statisticsListDetail")
	public String statisticsListDetail(){
		return "module/event/statisticsListDetail";
	}
}