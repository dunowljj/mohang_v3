package org.mohang.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
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
		log.info("----event insert form page----");
		return "module/event/insertForm";
	}
	
	//행사정보신청 > DB등록
	@PostMapping("/insertApply")
	public String insertApply(EventVO eventVO, MultipartFile e_file, MultipartFile e_dfile) throws ParseException{
		log.info("----try event insert----");
		
		//파일 저장
		log.info("----Ready to file save----");
		String uploadFolder = "C:\\Users\\HOME\\git\\mohang_v3\\MoHang\\src\\main\\webapp\\resources\\eventImages";
		//String uploadFolder = "../resources/eventImages";
	
		
		String e_fname = e_file.getOriginalFilename();
		String e_dfname = e_dfile.getOriginalFilename();
		
		
		eventVO.setE_fname(e_fname);
		eventVO.setE_dfname(e_dfname);
		eventVO.setO_num("4");
		
		e_fname = e_fname.substring(e_fname.lastIndexOf("\\")+1);
		e_dfname = e_dfname.substring(e_dfname.lastIndexOf("\\")+1);
		
		File saveE_file=new File(uploadFolder, e_fname);
		File saveE_dfile=new File(uploadFolder, e_dfname);
		
		try {
			e_file.transferTo(saveE_file);
			e_dfile.transferTo(saveE_dfile);
		} catch (Exception e) {
			log.error(e.getMessage());	
		}
		log.info("----file save success----");
		
		eventService.insertApply(eventVO);
		log.info("----insert success----");
		return "redirect:listApply";
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
		public String insertFormUpdate(@RequestParam("e_num") String e_num, Model model){
			model.addAttribute("event", eventService.getApply(e_num));
		return "module/event/insertFormUpdate";
	}
	
	//신청한 행사정보 수정페이지 
		@PostMapping("/updateApply")
		public String updateApply(EventVO eventVO){
			log.info("----try event Update----");
			eventVO.setO_num("4");
			eventService.updateApply(eventVO);
			log.info("----Update success----");
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