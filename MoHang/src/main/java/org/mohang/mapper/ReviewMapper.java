package org.mohang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mohang.domain.Criteria;
import org.mohang.domain.EventVO;
import org.mohang.domain.ReviewVO;

public interface ReviewMapper {

	public List<ReviewVO>  listReview(Criteria cri);

	public int totalReview(Criteria cri);

	public ReviewVO reviewDetail(String review_num);


	public EventVO eventGetName(@Param("account_num")String account_num,@Param("ticket_reservation_num") String ticket_reservation_num);

	public void updateHitCountReview(String review_num);
	
	public int insertReview(ReviewVO reviewVO);
	public int updateReview(ReviewVO reviewVO);
}
