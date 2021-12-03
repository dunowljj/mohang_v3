package org.mohang.service;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.GeneralAttachFileDTO;
import org.mohang.domain.GeneralAttachFileVO;
import org.mohang.domain.GeneralLikeListDTO;
import org.mohang.domain.GeneralMyReservationDTO;
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
	
	//reserveList
	public List<GeneralMyReservationDTO> getListMyReservation(String account_num);
	
	public boolean insertReservAndPay(TicketReservationDTO reservDTO, TicketPaymentDTO payDTO);

	//reserve,pay
//	boolean insertPay(TicketReservationDTO reservDTO, TicketPaymentDTO payDTO);
//	boolean insertReserv(TicketReservationDTO reservDTO, TicketPaymentDTO payDTO);
	public int getRemainTicket(String e_num);
	public int getTotalticket(String e_num);
}

