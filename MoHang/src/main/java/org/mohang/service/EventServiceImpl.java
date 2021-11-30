package org.mohang.service;


import java.util.Date;
import java.util.List;

import org.mohang.domain.EventHallVO;
import org.mohang.domain.EventVO;
import org.mohang.domain.LikedVO;
import org.mohang.domain.Search;
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
	public List<EventVO> listBestEvent(){
		return  mapper.listBestEvent();
	}
	
	@Override
	public List<EventVO> listMonthEvent(String search) {
		return mapper.listMonthEvent(search);
	}
	
	@Override
	public int insertApply(EventVO eventVO) {
		return mapper.insertApply(eventVO);
	}

	@Override
	public List<EventVO> listApply() {
		return mapper.listApply();
	}

	@Override
	public EventVO getApply(String e_num) {
		return mapper.getApply(e_num);

	}
	//충돌조심!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	@Override
	public List<EventVO> listRecommendEvent(String account_Interest) {
		// TODO Auto-generated method stub
		return mapper.listRecommendEvent(account_Interest);
	}
   
	@Override
	public EventVO eventDetail(String e_num) {
		return mapper.eventDetail(e_num);
		
	}

	@Override
	public List<EventVO> listEvent(Search search) {
		return mapper.listEvent(search);
	}

	@Override
	public int getTotalCount(Search search) {
		return mapper.getTotalCount(search);
	}

	/*
	 * 충돌 조심 !!
	 */
	@Override
	public EventHallVO eventHallGet(String e_num) {
		return mapper.eventHallGet(e_num);
	}
	
	@Override
	public int updateApply(EventVO eventVO){
		return mapper.updateApply(eventVO);
}
	/*
	 * 충돌 조심 !!
	 */
	@Override
	public int selectlike(String account_num, String e_num) {
		int re =-1;
		if(mapper.selectlike(account_num,e_num)==null){
				re=0;
		}else{
				re=1;
		}
		
		return  re;
	}
	/*
	 * 충돌조심
	 */
	@Override
	public boolean insertlike(String account_num, String e_num) {
		
		return mapper.insertlike(account_num,e_num)==1;
	}
	/*
	 * 충돌조심
	 */
	@Override
	public boolean updatedownlike(String account_num, String e_num) {
		return mapper.updatedownlike(account_num,e_num)==1;
	}
	/*
	 * 충돌조심
	 */
	@Override
	public void upcountlike(String account_num, String e_num) {	
		mapper.upcountlike(account_num,e_num);
	}
	/*
	 * 충돌조심
	 */
	@Override
	public void downcountlike(String account_num, String e_num) {
		mapper.downcountlike(account_num,e_num);
		
	}
	/*
	 * 충돌조심
	 */
	@Override
	public LikedVO statuslike(String account_num, String e_num) {
		return mapper.statuslike(account_num,e_num);
	}
	/*
	 * 충돌조심
	 */
	@Override
	public void updateuplike(String account_num, String e_num) {
		mapper.updateuplike(account_num,e_num);
	}

}

