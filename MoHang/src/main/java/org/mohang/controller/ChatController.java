package org.mohang.controller;

import java.util.List;

import javax.print.attribute.standard.Media;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mohang.domain.AccountVO;
import org.mohang.domain.ChatVO;
import org.mohang.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@RestController
@Data
@Log4j
@RequestMapping("/chat/*")
public class ChatController {

	@Autowired
	private ChatService service;
	
	@GetMapping("/Form")
	public ModelAndView Form() {
		log.info("Form Success");
						
		ModelAndView mav = new ModelAndView();
		mav.setViewName("module/chat/chatForm");
		return mav;
	}

	@GetMapping("/test")
	public ModelAndView test() {
		log.info("Client Success");
		ModelAndView mav = new ModelAndView();

		mav.addObject("msg", "Spring and Node");
		mav.setViewName("module/chat/chat");

		return mav;
	}
	
	@GetMapping(value = "/list", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<AccountVO>> getList(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		//AccountVO accountVO = (AccountVO)session.getAttribute("account");
		//String account_num = accountVO.getAccount_num(); 
		log.info("gggggggggggggggggggggggggggggggg");
		String account_num = "1";
		//model.addAttribute("account_num", account_num);
		//return null;
		return new ResponseEntity<>(service.getList(account_num), HttpStatus.OK);
	}
	
	@GetMapping(value = "/list/{room_num}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ChatVO>> getMessageList(@PathVariable("room_num") String room_num){
		
		return new ResponseEntity<>(service.getChatList(room_num), HttpStatus.OK);
	}
}