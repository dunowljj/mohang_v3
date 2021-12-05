package org.mohang.service;

import java.util.List;

import org.mohang.domain.ReviewCommentVO;
import org.mohang.mapper.ReviewCommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewCommentServiceImpl implements ReviewCommentService {
	
	@Autowired
	private ReviewCommentMapper mapper; 
	
	@Override
	public int insertReviewComment(ReviewCommentVO reviewCommentVO) {
		return mapper.insertReviewComment(reviewCommentVO);
	}
	
	@Override
	public List<ReviewCommentVO> getReviewComment(String review_num) {
		return mapper.getReviewComment(review_num);
	}

	@Override
	public ReviewCommentVO getMyReviewComment(String review_comment_num) {
		return mapper.getMyReviewComment(review_comment_num);
	}

	@Override
	public int updateReviewComment(ReviewCommentVO reviewCommentVO) {
		return mapper.updateReviewComment(reviewCommentVO);
	}

	@Override
	public int deleteReviewComment(String review_comment_num) {
		return mapper.deleteReviewComment(review_comment_num);
	}



}
