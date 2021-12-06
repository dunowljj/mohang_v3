package org.mohang.service;

import java.util.ArrayList;
import java.util.List;


import org.mohang.domain.AccountVO;
import org.mohang.domain.GeneralAttachFileDTO;
import org.mohang.domain.GeneralAttachFileVO;
import org.mohang.domain.GeneralLikeListDTO;
import org.mohang.domain.GeneralMyReservationDTO;
import org.mohang.domain.GeneralResPayTimeDTO;
import org.mohang.domain.ReservationLikeDTO;
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
		if(confirmIsLikeCancelAlready(account_num, e_num)){
			return false;
		}
		eventMapper.downcountlike(account_num, e_num);
		return mapper.updateLikeStatusCancel(account_num, e_num) ==1;
	}
	
	@Override
	public boolean confirmIsLikeCancelAlready(String account_num, String e_num) {
		if
		(mapper.getLikeStatusOfOne(account_num, e_num)==null||
				mapper.getLikeStatusOfOne(account_num, e_num).equals("0"))
		{
			return true;
		}
		return false;
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
	public boolean insertReservationAndPay(TicketReservationDTO reservDTO, TicketPaymentDTO payDTO, GeneralResPayTimeDTO RAP) {
		if((reservDTO.getTicket_reservation_amount() >	this.getRemainTicket(reservDTO.getE_num()))){
			return false;
		}
		
		if(mapper.insertTicketReservation(RAP, reservDTO) ==1){
			return mapper.insertTicketPay(RAP, payDTO, reservDTO.getTicket_reservation_num()) ==1;
		}
		
		return false;
	}

	@Override
	public int getRemainTicket(String e_num) {
		
		if(mapper.getSumOfTicketReservation(e_num) == null){
			return mapper.getRecruitePeople(e_num);
		}
		return mapper.getRemainTicket(e_num);
	}
	@Transactional
	@Override
	public int getTotalticket(String e_num) {
		int periodVolume = mapper.getEventPeriodVolume(e_num);
		int remainTicket = mapper.getRemainTicket(e_num);
		return periodVolume*remainTicket;
	}

	@Override
	public boolean attendEvent(String ticket_reservation_num) {
		return mapper.updateAttendStatus(ticket_reservation_num)==1;
	}

	@Transactional
	@Override
	public boolean cancelReservationAndPay(String ticket_reservation_num) {
		mapper.updateReservationCancel(ticket_reservation_num);
		return mapper.updatePayCancel(ticket_reservation_num)==1;
	}
//
//	@Override
//	public List<EventLikeDTO> listMyPartInReseravtion(String account_num, String e_num) {
//		List<EventLikeDTO> likeEventList = new ArrayList<EventLikeDTO>();
//		List<EventVO> eventList = mapper.getListApplyEvents(e_num);
//		List<LikedVO> likeList = mapper.getListLikeAll(account_num, e_num);
////			mapper.getListLikeAll(account_num, eventList.get(0).getE_num());
//			
//		for(int i=0; i<likeEventList.size(); i++){
//			likeEventList.add(new EventLikeDTO(eventList.get(i),)
//		}		
//					
//		
//		return  likeEventList;
//	}

	@Override
	public String getLikeStatusOfOne(String account_num, String e_num) {
		return mapper.getLikeStatusOfOne(account_num, e_num);
	}

	@Override
	public List<ReservationLikeDTO> listMyPartInEvent(String account_num) {
//	@Override
//	public List<ReservationLikeDTO> listMyPartInEvent(String account_num) {
		
//		List<GeneralMyReservationDTO> myResList = new ArrayList<GeneralMyReservationDTO>();
//				myResList = mapper.getListMyReservation(account_num);
		List<ReservationLikeDTO> resLikeList = new ArrayList<>();
		List<GeneralMyReservationDTO> gmrList =mapper.getListMyReservation(account_num);
		;
		for(int i=0; i<resLikeList.size(); i++){
			resLikeList.add(new ReservationLikeDTO(gmrList.get(i),
					eventMapper.listLikeEvent(account_num, mapper.getListMyReservation(account_num).get(i).getE_num())
					)
					//			mapper.getLikeStatusOfOne(account_num, myResList.get(i).getE_num())
			);
		}
		return resLikeList;
	}
//	return resLikeList;
//}
//	
	
	//-----Reserve-----
}


