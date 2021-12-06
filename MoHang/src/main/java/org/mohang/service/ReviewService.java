package org.mohang.service;

import java.util.List;

import org.mohang.domain.Criteria;
import org.mohang.domain.EventVO;
import org.mohang.domain.ReviewVO;

public interface ReviewService {

	public List<ReviewVO> listReview(Criteria cri);

	public int totalReview(Criteria cri);

	public ReviewVO reviewDetail(String review_num);

	public EventVO eventGetName(String account_num,String ticket_reservation_num);

	public void updateHitCountReview(String review_num);

}
