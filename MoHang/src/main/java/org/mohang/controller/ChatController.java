package org.mohang.controller;

import java.util.List;

import javax.print.attribute.standard.Media;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mohang.domain.AccountVO;
import org.mohang.domain.ChatDTO;
import org.mohang.domain.ChatVO;
import org.mohang.domain.EventVO;
import org.mohang.domain.RoomVO;
import org.mohang.service.ChatService;
import org.mohang.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/chat/*")
public class ChatController {

	@Autowired
	private ChatService service;
	
	@Autowired
	private EventService eventService;
	
	@GetMapping("/Form")
	public ModelAndView Form(HttpServletRequest req) {
		log.info("Form Success");
						
		ModelAndView mav = new ModelAndView();
		mav.setViewName("module/chat/chatForm");
		
		HttpSession session = req.getSession();
		String account_num = (String)session.getAttribute("account_num");
		
		mav.addObject("account_num", account_num);
		
		return mav;
	}
	
	@GetMapping("/add/{o_num}")
	public void addChat(HttpServletRequest req, HttpServletResponse res,@PathVariable("o_num") String o_num)
	throws Exception{
		
		
		HttpSession session = req.getSession();
		String account_num = (String)session.getAttribute("account_num");
		
		
		int parse_O_num = Integer.parseInt(o_num);
		
			log.info("@@@@@@@@@@@ Chat Add@@@@@@@@@@@");
			String writerAccount_num = service.getWriterAccount_num(o_num);
			log.info("WriterAccount: "+ writerAccount_num);
			service.addchatList(account_num, writerAccount_num);
			
			
			res.sendRedirect("/chat/Form");
	}



	@GetMapping(value = "/list", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ChatDTO>> getList(HttpServletRequest request){
		HttpSession session = request.getSession();
		String account_num = null; 
		account_num =  (String)session.getAttribute("account_num");
		
		if(account_num == null){
			account_num ="0"; 		
			return null;
		}else {
			return new ResponseEntity<>(service.getList(account_num), HttpStatus.OK);
		}
		
	}
	
	

	
	@GetMapping(value = "/list/{room_num}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ChatVO>> getMessageList(@PathVariable("room_num") String room_num, Model model){
		
		
		return new ResponseEntity<>(service.getChatList(room_num), HttpStatus.OK);
	}
	
	@PostMapping(value ="/new", 
			produces = {MediaType.TEXT_PLAIN_VALUE},
			consumes = "application/json")
	public ResponseEntity<String> createChatHistory(@RequestBody ChatVO chatVO){
		log.info("chatVO : " + chatVO);
		
		int result = service.addChatLog(chatVO);
		
		return result == 1 ? new ResponseEntity<>("sucess", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	@PostMapping(value ="/{room_num}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteChat(@PathVariable("room_num") String room_num){

		log.info("delete room: " + room_num);
		if(service.deleteChatLog(room_num) >= 0 ) {
			log.info("chatLog delete");
			if(service.deleteUser(room_num) > 1) {
				log.info("chatList delete");
				return service.deleteRoom(room_num) == 1 ? new ResponseEntity<>("success",HttpStatus.OK) :
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		
		
		return new  ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}