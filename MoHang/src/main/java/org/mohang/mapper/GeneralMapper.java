package org.mohang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mohang.domain.AccountVO;
import org.mohang.domain.EventVO;
import org.mohang.domain.GeneralLikeListDTO;
import org.mohang.domain.GeneralMyReservationDTO;
import org.mohang.domain.GeneralResPayTimeDTO;
import org.mohang.domain.LikedVO;
import org.mohang.domain.TicketPaymentDTO;
import org.mohang.domain.TicketReservationDTO;

public interface GeneralMapper {
	public int updateInformation(AccountVO account);
	
	public int updatePassword(AccountVO account);
	
	public AccountVO getInformation(String account_num);
	
	public String getPassword(String account_num);
//	public updateInformationAttach
	public List<GeneralLikeListDTO> getListLikes(String account_num);
	
	
	public String getLikeStatusOfOne(@Param("account_num")String account_num,@Param("e_num") String e_num);
	public int updateLikeStatusCancel(@Param("account_num") String account_num, @Param("e_num") String e_num);
	
	public List<GeneralMyReservationDTO> getListMyReservation(String account_num);
	
	//예약,결제
	public int insertTicketReservation(@Param("RAP")GeneralResPayTimeDTO RAP,@Param("reservDTO")TicketReservationDTO reservDTO);
	public int insertTicketPay(@Param("RAP")GeneralResPayTimeDTO RAP ,@Param("payDTO")TicketPaymentDTO payDTO,@Param("ticket_reservation_num")String ticket_reservation_num);
	//취소
	public int updateReservationCancel(String ticket_reservation_num);
	public int updatePayCancel(String ticket_reservation_num);
	//참석여부
	public int updateAttendStatus(String ticket_reservation_num);
	
//	public getListLikeAll
	
	
	public Integer getSumOfTicketReservation(String e_num);
	public int getRecruitePeople(String e_num);
	
	public Integer getRemainTicket(String e_num);
	
	public int getEventPeriodVolume(String e_num);
	
	public List<LikedVO> getListLikeAll(@Param("account_num")String account_num, @Param("e_num")String e_num);
	public List<EventVO> getListApplyEvents(String e_num);
	
	public int updateTicketReviewStatusTrue(String ticket_reservation_num);
}
