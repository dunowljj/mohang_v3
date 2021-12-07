package org.mohang.service;

import java.util.List;

import org.mohang.domain.ReviewCommentDTO;
import org.mohang.domain.ReviewCommentVO;

public interface ReviewCommentService {
	public int insertReviewComment(ReviewCommentVO reviewCommentVO);
	public List<ReviewCommentDTO> getReviewComment(String review_num);
	public ReviewCommentVO getMyReviewComment(String review_comment_num);
	public int updateReviewComment(ReviewCommentVO reviewCommentVO);
	public int deleteReviewComment(String review_comment_num);
}
