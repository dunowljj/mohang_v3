package org.mohang.mapper;

import java.util.List;

import org.mohang.domain.EventHallVO;
import org.mohang.domain.EventVO;
import org.mohang.domain.Search;

public interface EventMapper {
	
	public List<EventVO> listBestEvent();

	public List<EventVO> listMonthEvent(String search);

	public int insertApply (EventVO eventVO);
	
	public List<EventVO> listApply();
	
	public EventVO getApply(String e_num);

	public List<EventVO> listRecommendEvent(String account_Interest);

	public EventVO eventDetail(String e_num);

	public List<EventVO> listEvent(Search search);

	public int getTotalCount(Search search);
	//충돌 조심
	public EventHallVO eventHallGet(String e_num);

}
