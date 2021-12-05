package org.mohang.mapper;

import java.util.List;

import org.mohang.domain.Criteria;
import org.mohang.domain.EventVO;
import org.mohang.domain.ReviewVO;

public interface ReviewMapper {

	public List<ReviewVO>  listReview(Criteria cri);

	public int totalReview(Criteria cri);

	public ReviewVO reviewDetail(String review_num);

	public EventVO eventGetName(String account_num);
	
}
