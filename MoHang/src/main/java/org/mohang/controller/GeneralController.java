package org.mohang.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.mohang.domain.AccountVO;
import org.mohang.domain.GeneralAttachFileDTO;
import org.mohang.domain.GeneralAttachFileVO;
import org.mohang.domain.GeneralPasswordVO;
import org.mohang.service.GeneralService;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@GetMapping("/updateInformation")
	public String getInformation(Model model){
		GeneralAttachFileDTO dto = service.getAttach("2");
//		log.info("dfsafd" +dto.getAccount_path());
//	log.info(dto.getAccount_path());
		model.addAttribute("account", service.getInformation("2"));
		if(dto != null){
		model.addAttribute("attach",dto);
		}
		return "module/general/informationUpdateForm";
	}
	@PostMapping("/updateInformation")
	public String updateInformation(AccountVO account, GeneralAttachFileVO attach, Model model){
		log.info(account.toString());
		log.info(attach.toString());
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
	public String listMyReserve(Model model){
		log.info("MyReserveList");
		model.addAttribute("reserveList", service.getListMyReservation("2"));
		return "module/general/reserveList";
	}
	
	@GetMapping("/deleteReserve")
	public String deleteReserve(){
		log.info("delReserve");
		return "";
	}
	
	@GetMapping("/listLikes")
	public String listMyLikes(Model model){
		log.info("MyReview");
		model.addAttribute("likeList",service.getListLikes("1"));
		
//		log.info(service.listLikes("1").get(0).getE_startRecruiteDate());
		return "module/general/likeList";
	}
	@GetMapping("/listMyPartIn")
	public String listMyPartIn(){
		log.info("MyLikeList");
		return "module/general/reviewList";
	}
	@PostMapping("/cancelLike")
	@ResponseBody
	public String cancelLike(String account_num, String e_num){
		log.info("start cancelLike");
		log.info(account_num.getClass());
		log.info(e_num.getClass());
		
		log.info(account_num);
		log.info(e_num);
		
	service.cancelLikeDisplay(account_num, e_num);
			log.info("success cancle heart");
			log.info("end cancelLike");
		
		return "cancel success";
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
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//		return "";
//	}
	@PostMapping(value ="/uploadProfile",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<GeneralAttachFileDTO>
	uploadAjaxPost(MultipartFile uploadFile){
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
		
		Date date = new Date();
		
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
