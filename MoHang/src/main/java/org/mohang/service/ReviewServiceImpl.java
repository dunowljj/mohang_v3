package org.mohang.service;

import java.util.List;

import org.mohang.domain.Criteria;
import org.mohang.domain.EventVO;
import org.mohang.domain.ReviewVO;
import org.mohang.mapper.AdminMapper;
import org.mohang.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	ReviewMapper reviewMapper;

	@Override
	public List<ReviewVO>  listReview(Criteria cri) {
		// TODO Auto-generated method stub
		return reviewMapper.listReview(cri);
	}

	@Override
	public int totalReview(Criteria cri) {
		// TODO Auto-generated method stub
		return reviewMapper.totalReview(cri);
	}

	@Override
	public ReviewVO reviewDetail(String review_num) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewDetail(review_num);
	}

	@Override
	public EventVO eventGetName(String account_num,String ticket_reservation_num) {
		// TODO Auto-generated method stub
		return reviewMapper.eventGetName(account_num, ticket_reservation_num);
	}

	@Override
	public void updateHitCountReview(String review_num) {
		
		 reviewMapper.updateHitCountReview(review_num);
		
	}
	
}
