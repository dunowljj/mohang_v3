package org.mohang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mohang.domain.EventHallVO;
import org.mohang.domain.EventVO;
import org.mohang.domain.LikedVO;
import org.mohang.domain.Search;
import org.mohang.domain.StatisticsDTO;
import org.mohang.domain.StatisticsDetailDTO;
import org.mohang.domain.StatisticsDetailDTO;

public interface EventMapper {
	
	public List<EventVO> listBestEvent();

	public List<EventVO> listMonthEvent(String search);

	public int insertApply (EventVO eventVO);
	
	public List<EventVO> listApply();
	
	public EventVO getApply(String e_num);


	public List<EventVO> listRecommendEvent(String account_Interest);

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

	public List<EventVO> listStatistics();
	public List<StatisticsDetailDTO> getStatistics(String e_num);

	//충돌 조심
	public LikedVO listLikeEvent(@Param("account_num")String account_num, @Param("e_num")String e_num);
	//충돌 조심
	public void firstinsertLikeEvent(@Param("e_num")String e_num,@Param("account_num") String account_num);

	
	//11/30지혜
	public int updateHitCount(String e_num);
}
