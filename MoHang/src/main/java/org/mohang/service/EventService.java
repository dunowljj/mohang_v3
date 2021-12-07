package org.mohang.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.mohang.domain.StatisticsInterestDTO;
import org.mohang.domain.StatisticsScopeDTO;

public interface EventService {
	public List<EventLikeDTO> listBestEvent(HttpServletRequest request);

	public List<EventVO> listMonthEvent(String search);
	
	public int insertApply(EventVO eventVO);
	
	public List<EventListDTO> listApply(String account_num, Criteria cri);
	
	public EventVO getApply(String e_num);
	
	public int updateApply(EventVO eventVO);

	public List<EventLikeDTO> listRecommendEvent(HttpServletRequest request);

	public EventVO eventDetail(String e_num);

	public List<EventLikeDTO> listEvent(Search search,HttpServletRequest request);

	public int getTotalCount(Search search);
	
	
	/*
	 * 충돌조심
	 */
	public EventHallVO eventHallGet(String e_num);
	/*
	 * 충돌조심
	 */
	public int selectlike(String account_num, String e_num);
	/*
	 * 충돌조심
	 */
	public boolean insertlike(String account_num, String e_num);
	/*
	 * 충돌조심
	 */
	public boolean updatedownlike(String account_num, String e_num);
	/*
	 * 충돌조심
	 */
	public void upcountlike(String account_num, String e_num);
	/*
	 * 충돌조심
	 */
	public void downcountlike(String account_num, String e_num);
	/*
	 * 충돌조심
	 */
	public LikedVO statuslike(String account_num, String e_num);
	/*
	 * 충돌조심
	 */
	public void updateuplike(String account_num, String e_num);

	//<-지혜
	public List<EventVO> listStatistics(String o_num, Criteria cri);
	public StatisticsDTO getStatistics(String e_num);
	public EventVO getApplyAndHitcount(String e_num); 

	public LikedVO selectlikeone(String string, String e_num);
	
	public List<StatisticsAgeDTO> getStatistics_ageGender(String e_num);
	
	public List<StatisticsInterestDTO> getStatistics_interest(String e_num);

	int insertEventHallReservation(Event_Hall_ReservationVO eventHallReservationVO);

	public int  insertApprove(ApproveVO approveVO);
	
	public String getOnum(String account_num);

	public List<EventVO> listDayEvent(String search);

	public int pay(String ap_num);

	public int CountStatistics(String o_num, Criteria cri);

	public int CountlistApply(String account_num, Criteria cri);

	public List<StatisticsScopeDTO> getReviewScope(String e_num);

}
