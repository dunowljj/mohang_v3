package org.mohang.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.mohang.domain.AccountVO;
import org.mohang.domain.GeneralAttachFileDTO;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		
		model.addAttribute("account",service.getInformation("A-2"));
		return "module/general/informationUpdateForm";
	}
	@PostMapping("/updateInformation")
	public String updateInformation(AccountVO account, Model model){
		if(service.updateInformation(account)){
			log.info("success");
		}
		return "redirect:/general/updateInformation";
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
	@GetMapping("/listMyPartIn")
	public String listMyPartIn(){
		log.info("MyReview");
		return "module/general/reviewList";
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
			attachDTO.setName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString()+"_"+ uploadFileName;
			
			//File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				uploadFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				//check image type file
				if (checkImageType(saveFile)){
					
					attachDTO.setImage(true);
					
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
	

}
