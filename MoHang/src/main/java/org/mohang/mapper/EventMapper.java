package org.mohang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mohang.domain.ApproveVO;
import org.mohang.domain.Criteria;
import org.mohang.domain.EventHallVO;
import org.mohang.domain.EventLikeDTO;
import org.mohang.domain.EventListDTO;
import org.mohang.domain.EventVO;
import org.mohang.domain.Event_Hall_ReservationVO;
import org.mohang.domain.LikedVO;
import org.mohang.domain.OrganizationVO;
import org.mohang.domain.Search;
import org.mohang.domain.StatisticsAgeDTO;
import org.mohang.domain.StatisticsDTO;
import org.mohang.domain.StatisticsDetailDTO;
import org.mohang.domain.StatisticsInterestDTO;
import org.mohang.domain.StatisticsScopeDTO;

public interface EventMapper {
	
	public List<EventVO> listBestEvent();

	public List<EventVO> listMonthEvent(String search);

	public int insertApply (EventVO eventVO);
	
	public int insertEventHallReservation(Event_Hall_ReservationVO eventHallReservationVO);
	
	public List<EventListDTO> listApply(@Param("account_num")String account_num, @Param("cri")Criteria cri);
	
	public EventVO getApply(String e_num);


	public List<EventVO> listRecommendEvent(List<String> account_interest);

	public EventVO eventDetail(String e_num);

	public List<EventVO> listEvent(Search search);

	public int getTotalCount(Search search);
	//충돌 조심
	public EventHallVO eventHallGet(String e_num);

	public int updateApply (EventVO eventVO);

	public LikedVO selectlike(@Param("account_num")String account_num, @Param("e_num")String e_num);
	//충돌 조심
	public int insertlike(@Param("account_num")String account_num, @Param("e_num")String e_num);
	//충돌 조심
	public int updatedownlike(@Param("account_num")String account_num, @Param("e_num")String e_num);
	//충돌 조심
	public void upcountlike(@Param("account_num")String account_num, @Param("e_num")String e_num);
	//충돌 조심
	public void downcountlike(@Param("account_num")String account_num,@Param("e_num")String e_num);
	//충돌 조심
	public LikedVO statuslike(@Param("account_num")String account_num,@Param("e_num")String e_num);
	//충돌 조심
	public void updateuplike(@Param("account_num")String account_num, @Param("e_num")String e_num);

	public List<EventVO> listStatistics(@Param("o_num")String o_num, @Param("cri")Criteria cri);
	public List<StatisticsDetailDTO> getStatistics(String e_num);
	//충돌 조심 용환 2021-12-03
	public List<EventVO> listHitcountEvent();
	//충돌 조심
	public LikedVO listLikeEvent(@Param("account_num")String account_num, @Param("e_num")String e_num);
	//충돌 조심
	public void firstinsertLikeEvent(@Param("e_num")String e_num,@Param("account_num") String account_num);
	//충돌 조심
	public LikedVO selectlikeone(@Param("account_num")String account_num, @Param("e_num")String e_num);
	//층돌 조심
	public List<EventLikeDTO> listSecondEvent(Search search);
	//11/30지혜
	public int updateHitCount(String e_num);
	
	public List<StatisticsAgeDTO> getStatistics_ageGender(String e_num);

	public List<StatisticsInterestDTO> getStatistics_interest(String e_num);

	public int insertApprove(ApproveVO approveVO);
	
	public String getOnum(String account_num);

	public List<EventVO> listDayEvent(String search);
	
	
	public int pay(String ap_num);

	public int CountStatistics(@Param("o_num")String o_num,@Param("cri") Criteria cri);

	public int CountlistApply(@Param("account_num")String account_num, @Param("cri")Criteria cri);

	public List<StatisticsScopeDTO> getReviewScope(String e_num);

	public String getF_name(String e_num);

	public String getDf_name(String e_num);

}
