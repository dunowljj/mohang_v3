package org.mohang.service;

import org.mohang.domain.AccountVO;


public interface GeneralService  {
	
	public AccountVO getInformation(String account_num);
	
	public boolean updateInformation(AccountVO accountVO);
}

