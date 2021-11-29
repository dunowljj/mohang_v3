package org.mohang.service;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.GeneralAttachFileDTO;
import org.mohang.domain.GeneralAttachFileVO;
import org.mohang.domain.GeneralLikeListDTO;


public interface GeneralService  {
	
	public AccountVO getInformation(String account_num);
	
	public GeneralAttachFileDTO getAttach(String account_num);
	
	public boolean updateInformation(AccountVO accountVO, GeneralAttachFileVO attachVO);
	
	public boolean updatePassword(String account_num, String password);
	
	//password
	public boolean matchPresentPassword(String account_num, String inputPassword);
	public boolean matchNewPassword(String pw1, String pw2);
	
	public List<GeneralLikeListDTO> listLikes(String account_num);
}

