package org.mohang.service;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.ApproveDTO;
import org.mohang.domain.Criteria;
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
	
	/*페이징 처리 되기전  원래 리스트 리뷰 조회*/
/*	public List<ReviewVO> listReview(){
		return mapper.listReview();
	}*/
	
	/*페이징 처리 되기전 원래 리스트 공지사항 조회*/
	/*public List<NoticeVO> listNotice(){
		return mapper.listNotice();
	}*/
	
	public List<NoticeVO> listNotice(Criteria cri){
		return mapper.getNoticePaging(cri);
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

	
	public ReviewVO detailReview(String review_num) {
		
		return mapper.detailReview(review_num);
	}

	@Override
	public int resisterNotice(NoticeVO notice) {
		
		return mapper.resisterNotice(notice);
		
	}

	@Override
	public int updateNotice(NoticeVO notice) {
		
		return mapper.updateNotice(notice);
	}

	@Override
	public NoticeVO updateNoticeForm(String notice_num) {
		
		return mapper.updateNoticeForm(notice_num);
	}

	@Override
	public void updatestatuswait(String ap_num, String admin_num) {
		mapper.updatestatuswait(ap_num,admin_num);
		
	}
	@Override
	public void updateApprovebtn(String ap_num, String admin_num) {
		mapper.updateApprovebtn(ap_num,admin_num);
		
	}

	@Override
	public List<NoticeVO> getNoticePaging(Criteria cri) {
		
		return mapper.getNoticePaging(cri);
	}

	@Override
	public int getNoticeTotal() {
		
		return mapper.getNoticeTotal();
	}

	@Override
	public int deleteAccount(String account_num) {
	
		return mapper.deleteAccount(account_num);
	}

	@Override
	public List<ReviewVO> getReviewPaging(Criteria cri) {
		
		return mapper.getReviewPaging(cri);
	}

	@Override
	public int getReviewTotal() {
		
		return mapper.getReviewTotal();
	}

	

	
	
	


	
	
	
	
	
}
