package org.mohang.service;

import java.util.Date;
import java.util.List;

import org.mohang.domain.EventVO;
import org.mohang.mapper.EventMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class EventServiceImpl implements EventService{
	@Autowired
	private EventMapper mapper;
	//베스트행사
	public List<EventVO> listEvent(){
		return  mapper.listEvent();
	}
	@Override
	public List<EventVO> listMonthEvent(String search) {
		return mapper.listMonthEvent(search);
	}
	
	

}
