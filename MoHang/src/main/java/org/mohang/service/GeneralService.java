package org.mohang.service;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.GeneralAttachFileDTO;
import org.mohang.domain.GeneralAttachFileVO;
import org.mohang.domain.GeneralLikeListDTO;
import org.mohang.domain.GeneralMyReservationDTO;


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
	
}

