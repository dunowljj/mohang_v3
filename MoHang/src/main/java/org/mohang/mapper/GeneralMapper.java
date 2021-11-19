package org.mohang.mapper;

import org.mohang.domain.AccountVO;

public interface GeneralMapper {
	public int updateInformation(AccountVO account);
	
	public int updatePassword(AccountVO account);
	
	
}
