package org.mohang.mapper;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.GeneralLikeListDTO;

public interface GeneralMapper {
	public int updateInformation(AccountVO account);
	
	public int updatePassword(AccountVO account);
	
	public AccountVO getInformation(String account_num);
	
	public String getPassword(String account_num);
//	public updateInformationAttach
	public List<GeneralLikeListDTO> listLikes(String account_num);
}
