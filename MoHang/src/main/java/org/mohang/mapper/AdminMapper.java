package org.mohang.mapper;

import java.util.List; 

import org.mohang.domain.AccountVO;
import org.mohang.domain.ApproveDTO;
import org.mohang.domain.NoticeVO;
import org.mohang.domain.ReviewVO;
import org.mohang.domain.TicketReservationDTO;

public interface AdminMapper {
	/*반려승인리스트 조회*/
	public List<ApproveDTO> listApprove();
	
	/*회원관리리스트 조회*/
	public List<AccountVO> listAccount();
	
	/*회원관리리스트 삭제*/
	//public int deleteAccount(String account_num);
	
	/*반려승인리스트 삭제*/
	public int deleteApprove(String ap_num);
	public int deleteEventHall(String ap_num);
	
	/*승인버튼눌렀을시 비고란 버튼만 없어지고 다시 리스트 나오게*/
	public List<ApproveDTO> listApprovebtn();
	
	/*티켓예약리스트 조회*/
	public List<TicketReservationDTO> listreservationTicket();

	/*리뷰리스트 조회*/
	public List<ReviewVO> listReview();
	
	/*공지사항리스트 조회*/
	public List<NoticeVO> listNotice();
	
	/*공지사항리스트 삭제 버튼 눌렀을시 삭제*/
	public int deleteNotice(String notice_num);

	/*공지사항리스트에서 제목 눌렀을때 디테일페이지로 이동하는 코드*/
	public NoticeVO detailNotice(String notice_num);
	
	/*리뷰게시판 리스트 삭제*/
	public int deleteReview(String review_num);
	
	/*티켓에약리스트 삭제*/
	public int deleteTicketReservation(String ticket_reservation_num);

}
