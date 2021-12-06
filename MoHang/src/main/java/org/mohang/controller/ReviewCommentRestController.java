package org.mohang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mohang.domain.ReviewCommentVO;
import org.mohang.service.ReviewCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	@PostMapping("/insert")
	public ResponseEntity<String> insertReviewComment(@RequestBody ReviewCommentVO reviewCommentVO, HttpStatus status, HttpServletRequest request){
		log.info("--댓글전송--");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("account_num");
		String account_num = String.valueOf(obj);
		reviewCommentVO.setAccount_num(account_num);
		
		if(account_num.equals("0")){
		return new ResponseEntity<>( "error", HttpStatus.OK);
		}

/*		test용
		//비회원 0일때는 > 댓글못쓰게 return 로그인으로 
		String account_num = "0";
		reviewCommentVO.setAccount_num("2");
		
		if(account_num.equals("0")){
			return new ResponseEntity<>( "error", HttpStatus.OK);
		}*/
		
		int result = rcservice.insertReviewComment(reviewCommentVO);
		return (result ==1) ? new ResponseEntity<>( "success",HttpStatus.OK) : new ResponseEntity<>( "error", HttpStatus.OK);
	}

	
	//리뷰번호에 대한 게시글 출력
	@GetMapping("/getReviewComment/{review_num}")
	public ResponseEntity<List<ReviewCommentVO>> getReviewComment(@PathVariable("review_num") String review_num, HttpServletRequest request){
		
		log.info("--"+review_num+"번째 리뷰의 댓글 수신중--");
		List<ReviewCommentVO> commentList =rcservice.getReviewComment(review_num);
		return new ResponseEntity<>(commentList, HttpStatus.OK);
	}
	
	//댓글삭제 > 본인 댓글만 삭제 가능해야함. 
	@DeleteMapping("deleteReviewComment/{review_comment_num}")
	public ResponseEntity<String> deleteReviewComment(@PathVariable("review_comment_num") String review_comment_num, HttpServletRequest request){
		/*HttpSession session = request.getSession();
		Object obj = session.getAttribute("account_num");
		String account_num = String.valueOf(obj);
*/
		log.info(review_comment_num+"번댓글 삭제");
		int result = rcservice.deleteReviewComment(review_comment_num);
		return (result ==1) ? new ResponseEntity<>( "delete success",HttpStatus.OK) : new ResponseEntity<>( "error", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	/*//수정
	@PostMapping("/updateReviewComment/{review_comment_num}")
	public ResponseEntity<String> updateReviewComment(@RequestBody ReviewCommentVO reviewCommentVO, @PathVariable("review_comment_num") String review_comment_num, HttpStatus status){
		reviewCommentVO.setAccount_num(review_comment_num);
		int result = rcservice.updateReviewComment(reviewCommentVO);
		return (result ==1)? new ResponseEntity<>("update success", status.OK):  new ResponseEntity<>("update fail", status.OK);
	}
	
	@GetMapping("/getMyReviewComment/{review_comment_num}")
	public ResponseEntity<ReviewCommentVO> getMyReviewComment(@PathVariable("review_comment_num") String review_comment_num, HttpStatus status){
		ReviewCommentVO myComment = rcservice.getMyReviewComment(review_comment_num);
		return new ResponseEntity<>(myComment,status.OK);
	}*/
}
