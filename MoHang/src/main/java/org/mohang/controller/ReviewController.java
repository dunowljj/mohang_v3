package org.mohang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mohang.domain.Criteria;
import org.mohang.domain.PageDTO;
import org.mohang.domain.ReviewVO;
import org.mohang.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")
@Log4j
public class ReviewController{
	@Autowired
	ReviewService reviewService;
	@GetMapping("/review")
	public String review(ReviewVO reviewVO,Model model,Criteria cri){
		List<ReviewVO> list = reviewService.listReview(cri);
		log.info("review:"+list);
		int total = reviewService.totalReview(cri);
		model.addAttribute("Review", reviewService.listReview(cri));
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		return "/module/review/review";
	}

	@GetMapping("/review_detail")
	public String review_detail(@RequestParam("review_num")String review_num,@RequestParam("account_num")String account_num,@RequestParam("ticket_reservation_num")String ticket_reservation_num,Model model, HttpServletRequest request){
		//로그인한 회원account_num **충돌주의**
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("account_num");
		String loginAccountNum = String.valueOf(obj);
		model.addAttribute("loginAccountNum", loginAccountNum);
		//**충돌주의**
		
		ReviewVO review = reviewService.reviewDetail(review_num);
		reviewService.updateHitCountReview(review.getReview_num());
		model.addAttribute("Review", review);
		
		model.addAttribute("Event", reviewService.eventGetName(account_num,ticket_reservation_num));
		return "/module/review/review_detail";
	}
	
}