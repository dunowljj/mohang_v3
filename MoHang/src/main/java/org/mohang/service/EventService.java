package org.mohang.service;

import java.util.List;

import org.mohang.domain.EventVO;

public interface EventService {
	public List<EventVO> listEvent();

	public List<EventVO> listMonthEvent(String search);
	
	public int insertApply(EventVO eventVO);
	
	public List<EventVO> listApply();
	
	public EventVO getApply(String e_num);
	
	public int updateApply(EventVO eventVO);

}
