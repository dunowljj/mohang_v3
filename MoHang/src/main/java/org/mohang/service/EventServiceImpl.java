package org.mohang.service;


import java.util.Date;
import java.util.List;

import org.mohang.domain.EventHallVO;
import org.mohang.domain.EventVO;
import org.mohang.domain.Search;
import org.mohang.domain.StatisticsDTO;
import org.mohang.domain.StatisticsDetailDTO;
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
	 * 
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

	//<-지혜
	@Override
	public List<EventVO> listStatistics() {
		return mapper.listStatistics();
	}
	
	@Override
	public StatisticsDTO getStatistics(String e_num){
		EventVO eventVO = mapper.getApply(e_num);
		StatisticsDTO statistics = new StatisticsDTO();
		
		//예약건수 부르기
		List<StatisticsDetailDTO> reservationList= mapper.reservationStatistics(e_num);
		int cancelTicket=0;
		int realTicket=0;
		
		for(int i=0; i<reservationList.size(); i++){
			if(reservationList.get(i).getTicket_reservation_status().equals("n")){
				cancelTicket+=reservationList.get(i).getTicket_reservation_amount();
			}else{
				realTicket +=reservationList.get(i).getTicket_reservation_amount();
			}
		};
		
		int totalTicket=cancelTicket+realTicket;
		System.out.println(reservationList.get(0).getTicket_reservation_amount());
		System.out.println(reservationList.get(0).getTicket_reservation_amount());
		log.info(cancelTicket);
		log.info(realTicket);
		log.info(totalTicket);
		//예약건수
		 statistics.setReservation(realTicket);
		 //예약율: 실제예약/조회수
		 double ratioReservation = (double)(realTicket/eventVO.getE_hitcount())*100;
		statistics.setRatioReservation(ratioReservation);
		//예약취소율: 
		double rationReservationCancel = (double)(cancelTicket/totalTicket)*100;
		statistics.setRationReservationCancel(rationReservationCancel);
		
		return statistics;
	}
	
	

}

