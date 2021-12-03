package org.mohang.service;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.GeneralAttachFileDTO;
import org.mohang.domain.GeneralAttachFileVO;
import org.mohang.domain.GeneralLikeListDTO;
import org.mohang.domain.GeneralMyReservationDTO;
import org.mohang.domain.TicketPaymentDTO;
import org.mohang.domain.TicketReservationDTO;
import org.mohang.mapper.EventMapper;
import org.mohang.mapper.GeneralAttachMapper;
import org.mohang.mapper.GeneralMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class GeneralServiceImpl implements GeneralService {

	@Autowired
	private GeneralMapper mapper;
	
	@Autowired
	private GeneralAttachMapper attachMapper;
	
	@Autowired
	private EventMapper eventMapper;
	
	@Override
	public AccountVO getInformation(String account_num) {
		
		return mapper.getInformation(account_num);
	}
	
//	@Transactional
	@Override
	public boolean updateInformation(AccountVO accountVO, GeneralAttachFileVO attachVO) {
		
		boolean updateResult = mapper.updateInformation(accountVO) == 1;
//		GeneralAttachFileDTO attachDTO = attachMapper.getInformationAttach(accountVO.getAccount_num());
		if(updateResult && attachVO != null){
			boolean result = attachMapper.updateInformationAttach(attachVO) ==1;
			
			return result;
		}
		return updateResult;
	}

	@Override
	public GeneralAttachFileDTO getAttach(String account_num) {
		return attachMapper.getInformationAttach(account_num);
	}

	
	//----password check----
	@Override
	public boolean matchPresentPassword(String account_num, String inputPassword) {
		return inputPassword.equals(mapper.getPassword(account_num));
	}

	@Override
	public boolean matchNewPassword(String pw1, String pw2) {
		return pw1.equals(pw2);
	}

	@Override
	public boolean updatePassword(String account_num, String password) {
		AccountVO accountVO = new AccountVO();
		accountVO.setAccount_num(account_num);
		accountVO.setAccount_password(password);
		
		return mapper.updatePassword(accountVO) ==1;
	}
	//----password check end----

	//----Like start----
	@Override
	public List<GeneralLikeListDTO> getListLikes(String account_num) {
		return mapper.getListLikes(account_num);
	}
	
	@Transactional
	@Override
	public boolean cancelLikeDisplay(String account_num, String e_num) {
		eventMapper.downcountlike(account_num, e_num);
		return mapper.updateLikeStatus(account_num, e_num) ==1;
	}
	//----Like end----
	
	//-----ReserveList----
	@Override
	public List<GeneralMyReservationDTO> getListMyReservation(String account_num) {
		return mapper.getListMyReservation(account_num);
	}
	//-----ReserveList----

	//-----Reserve-----
//	@Transactional
	@Override
	public boolean insertReservAndPay(TicketReservationDTO reservDTO, TicketPaymentDTO payDTO) {
		
		if(reservDTO.getTicket_reservation_amount() > 
				mapper.getRemainTicket(reservDTO.getE_num())){
			return false;
		}
		if(mapper.insertTicketReserv(reservDTO) ==1){
			return mapper.insertTicketPay(payDTO, reservDTO.getTicket_reservation_num()) ==1;
		}
		
		return false;
	}

	@Override
	public int getRemainTicket(String e_num) {
		
		if(mapper.getSumOfTicketReserv(e_num) == null){
			return mapper.getRecruitePeople(e_num);
		}
		return mapper.getRemainTicket(e_num);
	}

	@Override
	public int getTotalticket(String e_num) {
		int periodVolume = mapper.getEventPeriodVolume(e_num);
		int remainTicket = mapper.getRemainTicket(e_num);
		return periodVolume*remainTicket;
	}
	
	
	//-----Reserve-----

}


