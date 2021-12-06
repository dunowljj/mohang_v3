package org.mohang.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mohang.domain.AccountVO;
import org.mohang.domain.EventVO;
import org.mohang.domain.GeneralAttachFileDTO;
import org.mohang.domain.GeneralAttachFileVO;
import org.mohang.domain.GeneralMyReservationDTO;
import org.mohang.domain.GeneralPasswordVO;
import org.mohang.domain.GeneralResPayTimeDTO;
import org.mohang.domain.OrganizationVO;
import org.mohang.domain.ReservationLikeDTO;
import org.mohang.domain.ReviewVO;
import org.mohang.domain.TicketPaymentDTO;
import org.mohang.domain.TicketReservationDTO;
import org.mohang.mapper.GeneralMapper;
import org.mohang.service.EventService;
import org.mohang.service.GeneralService;
import org.mohang.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j
@Controller
@RequestMapping("/general/*")
public class GeneralController {
	
	@Autowired
	private GeneralService service;
	
	@Autowired
	private OrganizationService orgService;
	
	@Autowired
	private EventService eventService;
	
	
	@Autowired
	private GeneralMapper mapper;
	
	@GetMapping("/updateInformation")
	public String getInformation(HttpServletRequest request, Model model){
		//logIn check
		HttpSession session = request.getSession();
		String account_num =String.valueOf(session.getAttribute("account_num"));
		if(("0").equals(account_num) || account_num=="null"|| ("null").equals(account_num)){
			return "redirect:/login/login";
		}
		//logIn checked
		
		GeneralAttachFileDTO dto = service.getAttach(account_num);
//		log.info("dfsafd" +dto.getAccount_path());
//	log.info(dto.getAccount_path());
		model.addAttribute("account", service.getInformation(account_num));
		if(dto != null){
		model.addAttribute("attach",dto);
		}
		return "module/general/informationUpdateForm";
	}
	
	@PostMapping("/updateInformation")
	public String updateInformation(HttpServletRequest request, AccountVO account, GeneralAttachFileVO attach, Model model){
		//logIn check
		HttpSession session = request.getSession();
		String account_num =String.valueOf(session.getAttribute("account_num"));
		if(("0").equals(account_num) || account_num=="null"|| ("null").equals(account_num)){
			return "redirect:/login/login";
		}
		//logIn checked
		
		if(service.updateInformation(account, attach)){
			log.info("success");
		}
		return "redirect:/general/updateInformation";
	}
	
	
	
	@PostMapping("/updatePassword")
	public String updatePassword(GeneralPasswordVO pw, @RequestParam String account_num, RedirectAttributes rttr){
		if(!service.matchPresentPassword(account_num, pw.getPassword())){
			
			rttr.addFlashAttribute("message", "현재 비밀번호가 일치하지 않습니다.");
			return "redirect:/general/updateInformation";
//					+ "?account_num="+account_num;
			
		}else if(!service.matchNewPassword(pw.getPassword1(), pw.getPassword2())){
			
			rttr.addFlashAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "redirect:/general/updateInformation";
//					+ "?account_num="+account_num;
		}
			service.updatePassword(account_num, pw.getPassword1());
			rttr.addFlashAttribute("message", "비밀번호가 변경되었습니다.");
			
			return "redirect:/general/updateInformation";
//				+ "?account_num="+account_num;
	}
//	@ControllerAdvice
//	public class ExceptionController {
//		//custom예외처리
//		@ExceptionHandler(NoTicketException.class)
//		public String noTicket(NoTicketException nte) {
//
//			
//			
//			return ;
//		}
//	    
//	}
	
	@GetMapping("/insertReserve")
	public String insertReserve(){
		log.info("insertRe");
		
		return "";
	}

	@GetMapping("/reserve")
	public String reserveForm(HttpServletRequest request, Model model,@RequestParam("e_num") String e_num){
		log.info("reserveForm");
		//logIn check
		HttpSession session = request.getSession();
		String account_num =String.valueOf(session.getAttribute("account_num"));
		if(("0").equals(account_num) || account_num=="null"|| ("null").equals(account_num)){
			return "redirect:/login/login";
		}
		//logIn checked

		AccountVO accountVO = service.getInformation(account_num);//회원정보 받기
		OrganizationVO organizationVO = orgService.getOrganization(account_num);
		EventVO eventVO = eventService.getApply(e_num);	//행사번호를 넘겨받으면서 예약페이지로 넘어와야한다.
		model.addAttribute("remainTicket", service.getRemainTicket(e_num));
//		model.addAttribute("remainTicket", service.getTotalticket(e_num));
		model.addAttribute("account", accountVO);
		model.addAttribute("organization", organizationVO);
		model.addAttribute("event", eventVO);
		
		log.info("reserveForm end");
		return "module/general/reserveForm";
	}
	
	@PostMapping("/reserve")
	public String reserve(HttpServletRequest request, EventVO eventVO,TicketReservationDTO reservDTO, TicketPaymentDTO payDTO,
			GeneralResPayTimeDTO RAP, RedirectAttributes rttr){
		//logIn check
		HttpSession session = request.getSession();
		String account_num =String.valueOf(session.getAttribute("account_num"));
		if(("0").equals(account_num) || account_num=="null"|| ("null").equals(account_num)){
			return "redirect:/login/login";
		}
		//logIn checked
		
		log.info("RAP"+RAP);
		log.info(reservDTO);
		log.info(payDTO);
		
		if(service.insertReservationAndPay(reservDTO, payDTO, RAP)){
			log.info("success reserve");
		} else {
//			rttr.addAttribute("message","모두 매진되었습니다.");
//			rttr.addAttribute("returnURL","redirect:/general/reserve?e_num="+eventVO.getE_num());
//			return "redirect:/general/messagePop";
		}
		return "redirect:/event/eventDetail?e_num="+eventVO.getE_num();
	}
//	@GetMapping("/messagePop")
//	public String messageSender(RedirectAttributes rttr, Model model){
////		@RequestParam("message")String message,@RequestParam("returnURL") String returnURL
//		model.addAttribute("message",rttr.getFlashAttributes());
////		model.addAttribute("returnURL",rttr.getFlashAttributes("returnURL");
//
//		return "module/general/messagePop";
//	}
//	
	
	@PostMapping("/attendEvent")
	public String attendEvent(@RequestParam("ticket_reservation_num")String ticket_reservation_num, Model model){
		log.info(ticket_reservation_num);
		
		if(service.attendEvent(ticket_reservation_num)){
			log.info("success attend");
		}else{
			log.info("fail attend");
		}
		return "redirect:/general/reservationList";
	}
	@PostMapping("/cancelReservation")
	public String cancelReserve(@RequestParam("ticket_reservation_num")String ticket_reservation_num, Model model){
		log.info(ticket_reservation_num);
		
		if(service.cancelReservationAndPay(ticket_reservation_num)){
			log.info("success cancelRP");
		}else{
			log.info("fali cancelRP");
			
		}
		return "redirect:/general/reservationList";
	}
	
	
	
	@GetMapping("/reservationList")
	public String listMyReserve(HttpServletRequest request, Model model){

		//logIn check
		HttpSession session = request.getSession();
		String account_num =String.valueOf(session.getAttribute("account_num"));
		if(("0").equals(account_num) || account_num=="null"|| ("null").equals(account_num)){
			return "redirect:/login/login";
		}
		//logIn checked
		
		
		
		log.info("MyReserveList");
		model.addAttribute("reserveList", service.getListMyReservation(account_num));
		return "module/general/reserveList";
	}
	
	@GetMapping("/deleteReserve")
	public String deleteReserve(){
		log.info("delReserve");
		return "";
	}
	
	@GetMapping("/listLikes")
	public String listMyLikes(HttpServletRequest request, Model model){
		//logIn check
		HttpSession session = request.getSession();
		String account_num =String.valueOf(session.getAttribute("account_num"));
		if(("0").equals(account_num) || account_num=="null"|| ("null").equals(account_num)){
			return "redirect:/login/login";
		}
		//logIn checked
		model.addAttribute("likeList",service.getListLikes(account_num));
		log.info("listlist:"+service.getListLikes(account_num));
//		log.info(service.listLikes("1").get(0).getE_startRecruiteDate());
		return "module/general/likeList";
	}
	
	@PostMapping("/cancelLike")
	@ResponseBody
	public String cancelLike(HttpServletRequest request, String e_num, Model model){
		//logIn check
		HttpSession session = request.getSession();
		String account_num =String.valueOf(session.getAttribute("account_num"));
		if(("0").equals(account_num) || account_num=="null"|| ("null").equals(account_num)){
			return "redirect:/login/login";
		}
		//logIn checked
		
		
		log.info(account_num.getClass());
		log.info(e_num.getClass());
		
		log.info(account_num);
		log.info(e_num);
		
	if
//	(true){
	(!service.cancelLikeDisplay(account_num, e_num)){
		return "failed";
	}
			log.info("success cancel heart");
			log.info("end cancelLike");
			log.info("end downcount");
		return "cancel success";
	}
	
	
	@GetMapping("/listMyPartIn")
	public String listMyPartIn(HttpServletRequest request,Model model){
		//logIn check
		HttpSession session = request.getSession();
		String account_num =String.valueOf(session.getAttribute("account_num"));
		if(("0").equals(account_num) || account_num=="null"|| ("null").equals(account_num)){
			return "redirect:/login/login";
		}
		//logIn checked
		
		
		List<ReservationLikeDTO> myPartInList =  service.listMyPartInEvent(account_num);
		model.addAttribute("myPartInList",myPartInList);
		
		return "module/general/reviewList";
	}
	
	@GetMapping("/review")
	public String reveiwForm(HttpServletRequest request,
			GeneralMyReservationDTO myReservationDTO, Model model){
		//logIn check
		HttpSession session = request.getSession();
		String account_num =String.valueOf(session.getAttribute("account_num"));
		if(("0").equals(account_num) || account_num=="null"|| ("null").equals(account_num)){
			return "redirect:/login/login";
		}
		//logIn checked
		AccountVO accountVO = (AccountVO)session.getAttribute("account");
		log.info(accountVO.getAccount_name());
		model.addAttribute("account", accountVO);
		model.addAttribute("reserveDTO", myReservationDTO);
		return "module/review/reviewForm";
	}
	
	@PostMapping("/review")
	public String insertReveiw(HttpServletRequest request, ReviewVO reviewVO){
//			,@RequestParam("ticket_reservation_num") String ticket_reservation_num){
		//logIn check
		HttpSession session = request.getSession();
		String account_num =String.valueOf(session.getAttribute("account_num"));
		if(("0").equals(account_num) || account_num=="null"|| ("null").equals(account_num)){
			return "redirect:/login/login";
		}
		//logIn checked
		
		if(service.insertReview(reviewVO)){
			log.info("Success insertReview");
		}else{
			log.info("failed insertReview");
		};
		
		
		return "redirect:/review/review";
	}
	//프로필 사진 업로드
//	@PostMapping("/uploadProfile")
//	public String uploadProfile(MultipartFile uploadFile){
//		
//		String uploadFolder = "C:\\MoHang";
//		log.info("-------------------------------------");
//		log.info("-------------------------------------");
//		log.info("Upload File Size"+uploadFile.getSize());
//		log.info("Upload File Name"+uploadFile.getName());
//		log.info("Upload File OriginalName"+uploadFile.getOriginalFilename());
//		log.info("-------------------------------------");
//		
//		File saveFile = new File(uploadFolder, uploadFile.getOriginalFilename());
//		
//		try {
//			uploadFile.transferTo(saveFile);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		
//		return "";
//	}
	
	
	//-------------------------Profile upload----------------------
	@PostMapping(value ="/uploadProfile",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<GeneralAttachFileDTO>
	uploadProfileAjaxPost(MultipartFile uploadFile){
		log.info("Start@@@@@@@@@@@@@@@@@@@@@@");
		
//		String uploadFolder = "C:\\Users\\jhwoo_nb\\git\\mohang_v3\\MoHang\\src\\main\\webapp\\resources\\images";
//		String uploadFolder = "${pageContext.request.contextPath}"+"/resources/images";
		String uploadFolder = "C:\\upload";
		log.info(uploadFolder);
		String uploadFolderPath = getFolder();
		
		//make folder------
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path: "+ uploadPath);
		
		//make yyyy/MM/dd folder
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		log.info("uploadFolderPath:"+uploadFolderPath);
			
		GeneralAttachFileDTO attachDTO = new GeneralAttachFileDTO();
			
			log.info("----------------------------------------");
			log.info("Upload File Name: "+uploadFile.getOriginalFilename());
			log.info("Upload File Size: "+uploadFile.getSize());
			
			String uploadFileName = uploadFile.getOriginalFilename();
			
			//IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name: " + uploadFileName);
			attachDTO.setAccount_fileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString()+"_"+ uploadFileName;
			
			//File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				uploadFile.transferTo(saveFile);
				
				attachDTO.setAccount_uuid(uuid.toString());
				attachDTO.setAccount_path(uploadFolderPath);
				
				//check image type file
				if (checkImageType(saveFile)){
					
					attachDTO.setAccount_fileType(true);
					
					FileOutputStream thumbnail = new FileOutputStream(
							new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(uploadFile.getInputStream(),
							thumbnail, 100, 100);
					thumbnail.close();
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		log.info("Finish@@@@@@@@@@@@@@@@@@@@@@");
		return new ResponseEntity<>(attachDTO, HttpStatus.OK);
	}

	private String getFolder(){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date date = new java.util.Date();
		
		String str = sdf.format(date);
		
		return str.replace("-",  File.separator);
	}
	
	private boolean checkImageType(File file){
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String filename){
		
		log.info("fileName : " + filename);
		
		File file = new File("c:\\upload\\" + filename);
		
		log.info("file : "+file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
					header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@GetMapping(value = "/getAttach",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<GeneralAttachFileDTO> getAttach(String account_num){
		
		return new ResponseEntity<>(service.getAttach(account_num), HttpStatus.OK);
	}
	

}
