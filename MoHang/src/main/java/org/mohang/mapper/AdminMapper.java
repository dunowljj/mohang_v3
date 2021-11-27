package org.mohang.mapper;

import java.util.List; 

import org.mohang.domain.AccountVO;
import org.mohang.domain.ApproveDTO;
import org.mohang.domain.TicketReservationDTO;

public interface AdminMapper {
	/*반려승인리스트 조회*/
	public List<ApproveDTO> listApprove();
	
	/*회원관리리스트 조회*/
	public List<AccountVO> listAccount();
	
	/*반려승인리스트 삭제*/
	public int deleteApprove(String ap_num);
	public int deleteEventHall(String ap_num);
	
	/*승인버튼눌렀을시 비고란 버튼만 없어지고 다시 리스트 나오게*/
	public List<ApproveDTO> listApprovebtn();
	
	/*티켓예약리스트 조회*/
	public List<TicketReservationDTO> listreservationTicket();
}
