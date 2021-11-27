package org.mohang.mapper;

<<<<<<< HEAD
import java.util.Date;
=======
>>>>>>> origin/zlhey
import java.util.List;

import org.mohang.domain.EventVO;

public interface EventMapper {
<<<<<<< HEAD
	public List<EventVO> listEvent();

	public List<EventVO> listMonthEvent(String search);

	
=======
	public int insertApply (EventVO eventVO);
	public List<EventVO> listApply();
	public EventVO getApply(String e_num);
>>>>>>> origin/zlhey
}
