package org.mohang.service;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.ApproveDTO;
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
	
	public int deleteApprove(String ap_num){
		return mapper.deleteApprove(ap_num);
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
}
