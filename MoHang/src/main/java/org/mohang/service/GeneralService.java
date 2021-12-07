package org.mohang.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mohang.domain.AccountVO;
import org.mohang.domain.Criteria;
import org.mohang.domain.GeneralAttachFileDTO;
import org.mohang.domain.GeneralAttachFileVO;
import org.mohang.domain.GeneralLikeListDTO;
import org.mohang.domain.GeneralMyReservationDTO;
import org.mohang.domain.GeneralResPayTimeDTO;
import org.mohang.domain.ReservationLikeDTO;
import org.mohang.domain.ReviewVO;
import org.mohang.domain.TicketPaymentDTO;
import org.mohang.domain.TicketReservationDTO;


public interface GeneralService  {
	
	public AccountVO getInformation(String account_num);
	
	public GeneralAttachFileDTO getAttach(String account_num);
	
	public boolean updateInformation(AccountVO accountVO, GeneralAttachFileVO attachVO);
	
	public boolean updatePassword(String account_num, String password);
	
	//password
	public boolean matchPresentPassword(String account_num, String inputPassword);
	public boolean matchNewPassword(String pw1, String pw2);
	
	//like
	public List<GeneralLikeListDTO> getListLikes(String account_num);
	public boolean cancelLikeDisplay(String account_num, String e_num);
	public boolean confirmIsLikeCancelAlready(String account_num, String e_num);
	public String getLikeStatusOfOne(String account_num, String e_num);
	
	//reserveList
	public List<GeneralMyReservationDTO> getListMyReservation(String account_num);
	public List<GeneralMyReservationDTO> getListMyReservationWithPaging(String account_num,Criteria cri);
	
	//attend
	public boolean attendEvent(String ticket_reservation_num);
	public boolean cancelReservationAndPay(String ticket_reservation_num);

	//reserve,pay
	public boolean insertReservationAndPay(TicketReservationDTO reservDTO, TicketPaymentDTO payDTO, GeneralResPayTimeDTO RAP);
//	boolean insertPay(TicketReservationDTO reservDTO, TicketPaymentDTO payDTO);
//	boolean insertReserv(TicketReservationDTO reservDTO, TicketPaymentDTO payDTO);
	public int getRemainTicket(String e_num);
	public int getTotalticket(String e_num);
	
	public List<ReservationLikeDTO> listMyPartInEvent(String account_num);
//	public List<ReservationLikeDTO> listMyPartInEventWithPaging(String account_num, Criteria cri);
	public Integer getTotalReservation(String account_num);
	
	
	public boolean insertReview(ReviewVO reviewVO);
	public boolean updateReview(ReviewVO reviewVO);
	public List<ReviewVO> getReviewlist(String account_num);
}

