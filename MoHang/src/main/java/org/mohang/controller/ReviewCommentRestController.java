package org.mohang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mohang.domain.ReviewCommentVO;
import org.mohang.service.ReviewCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/restReviewComment/*")
public class ReviewCommentRestController {
	@Autowired
	private ReviewCommentService rcservice;
	
	//댓글등록: json타입의 댓글데이터 전송 후 문자열로 결과 알려줌. =json요청 받아서 자바객체로
	@PostMapping("/insertReviewComment")
	public ResponseEntity<String> insertReviewComment(@RequestBody ReviewCommentVO reviewCommentVO, HttpStatus status, HttpServletRequest request){
		log.info("--댓글전송--");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("account_num");
		String account_num = String.valueOf(obj);
		
		reviewCommentVO.setAccount_num(account_num);
		
		int result = rcservice.insertReviewComment(reviewCommentVO);
		return (result ==1) ? new ResponseEntity<>( "success",status.OK) : new ResponseEntity<>( "success", status.INTERNAL_SERVER_ERROR);
	}
	
	//리뷰번호에 대한 게시글 출력
	@GetMapping("/getReviewComment/{review_num}")
	public ResponseEntity<List<ReviewCommentVO>> getReviewComment(@PathVariable("review_num") String review_num){
		log.info("--"+review_num+"번째 리뷰의 댓글 수신중--");
		List<ReviewCommentVO> commentList =rcservice.getReviewComment(review_num);
		return new ResponseEntity<>(commentList, HttpStatus.OK);
	}

}
