package org.mohang.service;

import java.util.List;

import org.mohang.domain.EventHallVO;
import org.mohang.domain.EventLikeDTO;
import org.mohang.domain.EventVO;
import org.mohang.domain.LikedVO;
import org.mohang.domain.OrganizationVO;
import org.mohang.domain.Search;

public interface EventService {
	public List<EventLikeDTO> listBestEvent();

	public List<EventVO> listMonthEvent(String search);
	
	public int insertApply(EventVO eventVO);
	
	public List<EventVO> listApply();
	
	public EventVO getApply(String e_num);
	
	public int updateApply(EventVO eventVO);

	public List<EventVO> listRecommendEvent(String account_Interest);

	public EventVO eventDetail(String e_num);

	public List<EventVO> listEvent(Search search);

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



}
