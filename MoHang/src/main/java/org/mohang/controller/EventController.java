package org.mohang.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.mohang.domain.EventVO;
import org.mohang.domain.LikedVO;
import org.mohang.service.EventService;
import org.mohang.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@Autowired
	private OrganizationService organizationService;
	//행사신청정보페이지
	@GetMapping("/insertForm")
	public String insertForm(@RequestParam("o_num")String o_num, Model model){
		log.info("----event insert form page----");
		model.addAttribute("o_num",o_num);
		return "module/event/insertForm";
	}
	
	//행사정보신청 > DB등록
	@PostMapping("/insertApply")
	public String insertApply(HttpServletRequest request,  EventVO eventVO, MultipartFile e_file, MultipartFile e_dfile, @RequestParam("o_num")String o_num) throws ParseException{
		log.info("----try event insert----");
		
		//파일 저장
		log.info("----Ready to file save----");
		//String uploadFolder = "C:\\Users\\HOME\\git\\mohang_v3\\MoHang\\src\\main\\webapp\\resources\\images";
		String uploadFolder = request.getSession().getServletContext().getRealPath("/");
		uploadFolder+="resources/images/";
		
		String e_fname = e_file.getOriginalFilename();
		String e_dfname = e_dfile.getOriginalFilename();
		
		
		eventVO.setE_fname(e_fname);
		eventVO.setE_dfname(e_dfname);
		
		//근데 account_num을 못받아오면 이 번호를 어떻게 받아오지...???단체를 신청하면서 seq로 만들어서 넣어주고, 넣어줌과 동시에 여기로 넘겨야하나...?
		eventVO.setO_num(o_num);
		
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


	
	//리스트에서 이벤트 제목 클릭시 이벤트 글번호가 넘어가면서 DB불러옴
	@GetMapping("/getApply")
	public String getApply(@RequestParam("e_num") String e_num, Model model){
		EventVO event = eventService.getApply(e_num);
		String eh_num = event.getEh_num();
		model.addAttribute("event", event);
		model.addAttribute("eventHall", eventService.eventHallGet(eh_num));
		return "module/event/applyListDetail";
	}
	
	//신청한 행사정보 수정페이지 
	@GetMapping("/insertFormUpdate")
		public String insertFormUpdate(@RequestParam("e_num") String e_num, Model model){
			EventVO event = eventService.getApply(e_num);
			String eh_num = event.getEh_num();
			model.addAttribute("event", event);
			model.addAttribute("eventHall", eventService.eventHallGet(eh_num));
		return "module/event/insertFormUpdate";
	}
	
	//신청한 행사정보 수정페이지 
	@PostMapping("/updateApply")
	public String updateApply(EventVO eventVO, MultipartFile e_file, MultipartFile e_dfile, RedirectAttributes rttr){
		log.info("----try event Update----");
		//파일 저장
				log.info("----Ready to file save----");
				String uploadFolder = "C:\\Users\\HOME\\git\\mohang_v3\\MoHang\\src\\main\\webapp\\resources\\images";
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
				
				eventService.updateApply(eventVO);
		log.info("----Update success----");
		return "redirect:";
	}
	//충돌~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	//행사정보확인페이지
	@GetMapping("/eventDetail")
	public String eventDetail(@RequestParam("e_num") String e_num, Model model){
		//행사 정보
		model.addAttribute("event", eventService.eventDetail(e_num));
		EventVO event = eventService.eventDetail(e_num);
		String o_num = event.getO_num();
		String eh_num = event.getEh_num();
		//단체 정보
		model.addAttribute("organization", organizationService.getOrganizationOnum(o_num));
		//행사장 정보
		model.addAttribute("eventhall", eventService.eventHallGet(eh_num));
		//좋아요 정보
		//충돌 조심
		model.addAttribute("liked", eventService.selectlikeone("1", e_num));
		return "module/event/eventDetail";
	}
	
	//@@@@@지혜@@@@@@@@@@@
	//행사통계자료리스트확인페이지에서 자료 값 불러오기
	@GetMapping("/listStatistics")
	public String listStatistice(Model model){
		log.info("---load statistics list---");
		model.addAttribute("endEventList", eventService.listStatistics());
		return "module/event/statisticsList";
	}

	//통계정보상세조회페이지
	@GetMapping("/statisticsListDetail")
	public String statisticsListDetail(@RequestParam("e_num")String e_num,Model model){
		//글번호 받아서 행사정보랑, 통계관련 값 넘겨주는 작업 실행
		log.info("---load event"+e_num+" statistics---");
		EventVO event = eventService.getApply(e_num);
		String eh_num = event.getEh_num();
	
		model.addAttribute("endEvent", eventService.getApply(e_num));
		model.addAttribute("eventHall", eventService.eventHallGet(eh_num));
		model.addAttribute("statistics", eventService.getStatistics(e_num));
		return "module/event/statisticsListDetail";
	}
	
	
	
	
	
	/*
	 * 충돌 조심 좋아요 이벤트 
	 * 회원 번호와 글번호로 liked 조회시 
	 * 없으면 liked insert -> 좋아요 1 false
	 * 있으면 liked 0 true 
	 */
	@ResponseBody
	@PostMapping(value="like")
	public String eventLike(String account_num , String e_num){
		String result="";
		int check =eventService.selectlike(account_num,e_num);
		log.info("check :"+check);
		int re=-1;
		//false insert 행사 정보 좋아요 수 증가
		if(check==0){
			eventService.insertlike(account_num,e_num);
			eventService.upcountlike(account_num,e_num);
			result ="up";
		//true update 행사 정보 좋아요 수 감소
		}else if(check==1){
			// status가 1이면 눌린거 0이면 안눌린거  
			LikedVO likedVO =eventService.statuslike(account_num,e_num);
			re = likedVO.getLike_status();
			log.info("re :"+re);
			if(re==49){
				eventService.updatedownlike(account_num,e_num);
				eventService.downcountlike(account_num,e_num);
			}else if(re==48){
				eventService.updateuplike(account_num,e_num);
				eventService.upcountlike(account_num,e_num);
			}
			result ="down";
		}
		return result;
	}
	//@@@@@여기까지@@@@@@@@@@@


}