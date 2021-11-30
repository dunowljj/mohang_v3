package org.mohang.service;

import java.util.List; 

import org.mohang.domain.AccountVO;
import org.mohang.domain.ApproveDTO;
import org.mohang.domain.EventHallVO;
import org.mohang.domain.EventVO;
import org.mohang.domain.NoticeVO;
import org.mohang.domain.ReviewVO;
import org.mohang.domain.TicketReservationDTO;
import org.springframework.stereotype.Service;

@Service
public interface AdminService {
	/*반려승인리스트 조회 서비스*/
	public  List<ApproveDTO> listApprove();
	
	/*회원관리리스트 조회 서비스*/
	public List<AccountVO> listAccount();
	
	/*회원관리리스트 삭제*/
	//public int deleteAccount(String account_num);
	
	/*회원관리 리스트에서 회원아이디 눌렀을때 디테일 페이지 나오게끔*/
	public AccountVO detailAccount(String account_num);
	
	/*반려승인리스트 삭제*/
	public int deleteApprove(String ap_num);
	public int deleteEventHall(String ap_num);
	
	/*승인버튼눌렀을시 비고란 버튼만 없어지고 다시 리스트 나오게*/
	public List<ApproveDTO> listApprovebtn();
	
	/*승인반려리스트에서 글 제목 눌렀을시 디테일 페이지로 이동하게끔*/
	public EventVO detailApprove(String e_num);
	
	
	 /* 승인반려리스트에서 글제목 눌렀을때 디테일페이지로 이동하기 위해서 eventhall데이터도 필요하다 */
	public EventHallVO eventHallGet(String eh_num);
	
	/*티켓예약리스트 조회*/
	public List<TicketReservationDTO> listreservationTicket();

	/*리뷰리스트 조회*/
	public List<ReviewVO> listReview();
	
	/*공지사항리스트 조회*/
	public List<NoticeVO> listNotice();
	
	/*공지사항리스트 삭제 버튼 눌렀을시 삭제*/
	public int deleteNotice(String notice_num);
  
	/*공지사항리스트에서 글제목 눌렀을시 디테일페이지로 이동하는 부분*/
	public NoticeVO detailNotice(String notice_num);
	
	/*리뷰게시판 리스트 삭제*/
	public int deleteReview(String review_num);
	
	/*티켓에약리스트 삭제*/
	public int deleteTicketReservation(String ticket_reservation_num);
}
