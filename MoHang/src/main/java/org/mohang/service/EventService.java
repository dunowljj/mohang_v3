package org.mohang.service;

import java.util.Date;
import java.util.List;

import org.mohang.domain.EventVO;

public interface EventService {

	public List<EventVO> listEvent();

	public List<EventVO> listMonthEvent(String search);
	
}
