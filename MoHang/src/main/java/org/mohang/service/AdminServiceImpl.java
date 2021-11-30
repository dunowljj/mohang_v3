package org.mohang.service;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.ApproveDTO;
import org.mohang.domain.EventHallVO;
import org.mohang.domain.EventVO;
import org.mohang.domain.NoticeVO;
import org.mohang.domain.ReviewVO;
import org.mohang.domain.TicketReservationDTO;
import org.mohang.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
@NoArgsConstructor
public class AdminServiceImpl implements AdminService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	
	public List<ApproveDTO> listApprove(){
		return mapper.listApprove();
	}
	
	public List<AccountVO> listAccount(){
		return mapper.listAccount();
	}
	
	
	/*
    public int deleteAccount(String account_num) {
		
		return mapper.deleteAccount(account_num);
	}
	*/
	
	public int deleteApprove(String ap_num){
		return mapper.deleteApprove(ap_num);
	}
	
	
	public EventVO detailApprove(String e_num) {
		// TODO Auto-generated method stub
		return mapper.detailApprove(e_num);
	}
	
	public EventHallVO eventHallGet(String eh_num) {
		
		return mapper.eventHallGet(eh_num);
	}

	
	public int deleteEventHall(String ap_num){
		return mapper.deleteEventHall(ap_num);
	}
	
	public List<ApproveDTO> listApprovebtn(){
		return mapper.listApprove();
	}
	
	
	public List<TicketReservationDTO> listreservationTicket(){
		return mapper.listreservationTicket();
	}
	
	public List<ReviewVO> listReview(){
		return mapper.listReview();
	}
	
	public List<NoticeVO> listNotice(){
		return mapper.listNotice();
	}


	public NoticeVO detailNotice(String notice_num) {
		
		return	mapper.detailNotice(notice_num);
	}

	
	public int deleteReview(String review_num) {
		
		return mapper.deleteReview(review_num);
	}

	
	public int deleteTicketReservation(String ticket_reservation_num) {
		
		return mapper.deleteTicketReservation(ticket_reservation_num);
	}

	
	public int deleteNotice(String notice_num) {
		
		return mapper.deleteNotice(notice_num);
	}

	
	public AccountVO detailAccount(String account_num) {
		
		return mapper.detailAccount(account_num);
	}

	
	
	


	
	
	
	
	
}
