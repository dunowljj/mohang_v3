package org.mohang.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mohang.domain.AccountVO;
import org.mohang.domain.ApproveVO;
import org.mohang.domain.Criteria;
import org.mohang.domain.EventHallVO;
import org.mohang.domain.EventLikeDTO;
import org.mohang.domain.EventListDTO;
import org.mohang.domain.EventVO;
import org.mohang.domain.Event_Hall_ReservationVO;
import org.mohang.domain.LikedVO;
import org.mohang.domain.Search;
import org.mohang.domain.StatisticsAgeDTO;
import org.mohang.domain.StatisticsDTO;
import org.mohang.domain.StatisticsDetailDTO;
import org.mohang.domain.StatisticsInterestDTO;
import org.mohang.mapper.AdminMapper;
import org.mohang.mapper.EventMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EventServiceImpl implements EventService {

	@Autowired
	private EventMapper mapper;
	@Autowired
	private AdminMapper adminMapper;
	//충돌 조심
	@Override
	public LikedVO selectlikeone(String account_num, String e_num) {
		
		return mapper.selectlikeone(account_num,e_num);
	}
	//베스트행사
	public List<EventLikeDTO> listBestEvent(HttpServletRequest request){
		List<EventLikeDTO> likelist = new ArrayList<>();
		List<EventVO> list = mapper.listBestEvent();
		

		HttpSession session = request.getSession();
		String account_num = String.valueOf(session.getAttribute("account_num"));
	
		for (int i = 0; i < list.size(); i++) {
			log.info("test :" + mapper.listLikeEvent(account_num, list.get(i).getE_num()));
			if (mapper.listLikeEvent(account_num, list.get(i).getE_num()) == null) {
				mapper.firstinsertLikeEvent(list.get(i).getE_num(), account_num);
			}
		}
		for (int i = 0; i < list.size(); i++) {
			likelist.add(new EventLikeDTO(list.get(i), mapper.listLikeEvent(account_num, list.get(i).getE_num())));
		}
		return likelist;
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
	public int insertEventHallReservation(Event_Hall_ReservationVO eventHallReservationVO){
		return mapper.insertEventHallReservation(eventHallReservationVO);
	}

	@Override
	public List<EventListDTO> listApply(String account_num,Criteria cri) {
		return mapper.listApply(account_num,cri);
	}

	@Override
	public EventVO getApply(String e_num) {
		return mapper.getApply(e_num);

	}

	// 충돌조심!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!2021 12 03
	@Override
	public List<EventLikeDTO> listRecommendEvent(HttpServletRequest request) {
		List<EventLikeDTO> likelist = new ArrayList<>();
		List<String> account_interest = new ArrayList<>();
		HttpSession session = request.getSession();
		String account_num = String.valueOf(session.getAttribute("account_num"));
		if(account_num!="0"){
				AccountVO account = adminMapper.detailAccount(account_num);
				String account_interest1[] = account.getAccount_interest().split(",");
				for(int i=0;i<account_interest1.length;i++){
					account_interest.add(account_interest1[i]);
				}
				List<EventVO> list=mapper.listRecommendEvent(account_interest);
				if(list.isEmpty()){
						list=mapper.listHitcountEvent();
					for(int i=0;i<list.size();i++){
						if(mapper.listLikeEvent(account_num,list.get(i).getE_num())==null){
							mapper.firstinsertLikeEvent(list.get(i).getE_num(), account_num);
						}
					}
					for(int i=0;i<list.size();i++){
						likelist.add( new EventLikeDTO (list.get(i),  mapper.listLikeEvent(account_num,list.get(i).getE_num())));
					}
				}else{
					for(int i=0;i<list.size();i++){
						log.info("test :"+mapper.listLikeEvent(account_num,list.get(i).getE_num()));
						if(mapper.listLikeEvent(account_num,list.get(i).getE_num())==null){
							mapper.firstinsertLikeEvent(list.get(i).getE_num(), account_num);
						}
					}
					for(int i=0;i<list.size();i++){
						likelist.add( new EventLikeDTO (list.get(i),  mapper.listLikeEvent(account_num,list.get(i).getE_num())));
					}
				}
			
		}else if(account_num=="0"||account_num=="null"){
				
				List<EventVO> list=mapper.listHitcountEvent();
				for(int i=0;i<list.size();i++){
					if(mapper.listLikeEvent(account_num,list.get(i).getE_num())==null){
						mapper.firstinsertLikeEvent(list.get(i).getE_num(), account_num);
					}
				}
				for(int i=0;i<list.size();i++){
					likelist.add( new EventLikeDTO (list.get(i),  mapper.listLikeEvent(account_num,list.get(i).getE_num())));
				}
		}
		return likelist;
	}

	@Override
	public EventVO eventDetail(String e_num) {
		mapper.updateHitCount(e_num);
		return mapper.eventDetail(e_num);

	}
	//충돌!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	@Override
	public List<EventLikeDTO> listEvent(Search search,HttpServletRequest request) {
		List<EventLikeDTO> likelist = new ArrayList<>();
		List<EventVO> list=mapper.listEvent(search);
		HttpSession session = request.getSession();
		String account_num = String.valueOf(session.getAttribute("account_num"));
		for(int i=0;i<list.size();i++){
			if(mapper.listLikeEvent(account_num,list.get(i).getE_num())==null){
				mapper.firstinsertLikeEvent(list.get(i).getE_num(), account_num);
			}
		}
		for(int i=0;i<list.size();i++){
			likelist.add( new EventLikeDTO (list.get(i),  mapper.listLikeEvent(account_num,list.get(i).getE_num())));
		}
		return likelist;
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
	public int updateApply(EventVO eventVO) {
		return mapper.updateApply(eventVO);
	}

	/*
	 * 충돌 조심 !!
	 */
	@Override
	public int selectlike(String account_num, String e_num) {
		int re = -1;
		if (mapper.selectlike(account_num, e_num) == null) {
			re = 0;
		} else {
			re = 1;
		}

		return re;
	}

	/*
	 * 충돌조심
	 */
	@Override
	public boolean insertlike(String account_num, String e_num) {

		return mapper.insertlike(account_num, e_num) == 1;
	}

	/*
	 * 충돌조심
	 */
	@Override
	public boolean updatedownlike(String account_num, String e_num) {
		return mapper.updatedownlike(account_num, e_num) == 1;
	}

	/*
	 * 충돌조심
	 */
	@Override
	public void upcountlike(String account_num, String e_num) {
		mapper.upcountlike(account_num, e_num);
	}

	/*
	 * 충돌조심
	 */
	@Override
	public void downcountlike(String account_num, String e_num) {
		mapper.downcountlike(account_num, e_num);

	}

	/*
	 * 충돌조심
	 */
	@Override
	public LikedVO statuslike(String account_num, String e_num) {
		return mapper.statuslike(account_num, e_num);
	}

	/*
	 * 충돌조심
	 */
	@Override
	public void updateuplike(String account_num, String e_num) {
		mapper.updateuplike(account_num, e_num);
	}

	// <-지혜
	@Override
	public List<EventVO> listStatistics(String o_num, Criteria cri) {
		return mapper.listStatistics(o_num,cri);
	}

	@Override
	public StatisticsDTO getStatistics(String e_num) {
		StatisticsDTO statistics = new StatisticsDTO();
		EventVO eventVO = mapper.getApply(e_num);
		List<StatisticsDetailDTO> statisticsList = mapper.getStatistics(e_num);

		// 1. 예약율 조회(예약건수, 예약비율, 예약취소율)
		int cancelTicket = 0;
		int realTicket = 0;

		//한글로 수정..?
		for (int i = 0; i < statisticsList.size(); i++) {
			if (statisticsList.get(i).getTicket_reservation_status().equals("n")) {
				cancelTicket += statisticsList.get(i).getTicket_reservation_amount();
			} else {
				realTicket += statisticsList.get(i).getTicket_reservation_amount();
			}
		};

		int totalTicket = cancelTicket + realTicket;

		// 예약건수
		statistics.setReservation(realTicket);
		// 예약율: 실제예약/조회수
		System.out.println(realTicket);
		System.out.println(cancelTicket);
		System.out.println(totalTicket);
		System.out.println((double) realTicket / eventVO.getE_hitcount() * 100);
		System.out.println((double) cancelTicket / totalTicket * 100);

		double ratioReservation = 0;
		double rationReservationCancel = 0;

		if (eventVO.getE_hitcount() == 0 || realTicket == 0 || cancelTicket == 0 || totalTicket == 0) {
			ratioReservation = 0;
		} else {
			ratioReservation = ((double) realTicket / eventVO.getE_hitcount()) * 100;
			rationReservationCancel = ((double) cancelTicket / totalTicket) * 100;
		}
		
		statistics.setRatioReservation(ratioReservation);
		statistics.setRationReservationCancel(rationReservationCancel);

		return statistics;
	}
	
	@Override
	public EventVO getApplyAndHitcount(String e_num) {
		mapper.updateHitCount(e_num);
		return mapper.getApply(e_num);
	}
	
	@Override
	public List<StatisticsAgeDTO> getStatistics_ageGender(String e_num) {
		return mapper.getStatistics_ageGender(e_num);
	}
	
	@Override
	public List<StatisticsInterestDTO> getStatistics_interest(String e_num) {
		return  mapper.getStatistics_interest(e_num);
	}
	@Override
	public int insertApprove(ApproveVO approveVO) {
		return mapper.insertApprove(approveVO);
		
	}
	@Override
	public String getOnum(String account_num) {
		return mapper.getOnum(account_num);
	}
	@Override
	public List<EventVO> listDayEvent(String search) {
		return mapper.listDayEvent(search);
	}
	
	@Override
	public int pay(String ap_num){
		return mapper.pay(ap_num);
	}
	@Override
	public int CountStatistics(String o_num , Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.CountStatistics(o_num,cri);
	}
	@Override
	public int CountlistApply(String account_num, Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.CountlistApply(account_num,cri);
	}
	
	
	
	

}
