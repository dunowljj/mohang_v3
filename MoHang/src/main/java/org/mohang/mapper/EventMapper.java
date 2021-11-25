package org.mohang.mapper;

import java.util.Date;
import java.util.List;

import org.mohang.domain.EventVO;

public interface EventMapper {
	public List<EventVO> listEvent();

	public List<EventVO> listMonthEvent(String search);

	
}
