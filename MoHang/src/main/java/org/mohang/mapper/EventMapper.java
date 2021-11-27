package org.mohang.mapper;

import java.util.List;

import org.mohang.domain.EventVO;

public interface EventMapper {
	public int insertApply (EventVO eventVO);
	public List<EventVO> listApply();
	public EventVO getApply(String e_num);
}
