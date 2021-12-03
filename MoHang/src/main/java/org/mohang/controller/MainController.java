package org.mohang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mohang.domain.NoticeVO;
import org.mohang.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;
@Log4j
@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	NoticeService service;
	@GetMapping("/Main")
	public String main(Model model, HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession();
		String account_num =String.valueOf(session.getAttribute("account_num"));
		log.info("account_num:"+account_num);
		if(account_num=="null"||("null").equals(account_num)){
			session.setAttribute("account_num", "0");
		}
		List <NoticeVO> notice = service.getNotice();
		log.info(notice.get(0));
		model.addAttribute("notice", notice.get(0));

		return "Main";
	}
}
