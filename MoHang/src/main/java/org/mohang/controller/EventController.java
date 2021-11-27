package org.mohang.controller;

import java.util.logging.Logger;

import org.mohang.domain.EventVO;
import org.mohang.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/event/*")
public class EventController  {
	

	@Autowired
	private EventService eventService;
	
	//행사신청정보페이지
	@GetMapping("/insertForm")
	public String insertForm(){
		log.info("--event insert form page--");
		return "module/event/insertForm";
	}
	
	//행사정보신청 > DB등록
	@PostMapping("/insertApply")
	public String insertApply(EventVO eventVO){
		log.info("--try event insert--");
		log.info(eventVO);
		eventVO.setO_num("121");
		eventService.insertApply(eventVO);
		log.info("--insert success--");
		return "redirect:/applyList";
	}
	
	//행사신청리스트 확인페이지
	@GetMapping("/listApply")
	public String listApply(Model model){
		model.addAttribute("eventList", eventService.listApply());
		return "module/event/applyList";
	}

	
	//신청한 행사정보확인페이지
	@GetMapping("/applyInsertFormShow")
	public String applyInsertFormShow(){
		return "module/event/applyInsertFormShow";
	}
	
	//리스트에서 이벤트 제목 클릭시 이벤트 글번호가 넘어가면서 DB불러옴
	@GetMapping("/getApply")
	public String getApply(@RequestParam("e_num") String e_num, Model model){
		model.addAttribute("event", eventService.getApply(e_num));
		return "module/event/applyListDetail";
	}
	
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