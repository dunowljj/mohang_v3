package org.mohang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mohang.domain.AccountVO;
import org.mohang.domain.GeneralLikeListDTO;
import org.mohang.domain.GeneralMyReservationDTO;

public interface GeneralMapper {
	public int updateInformation(AccountVO account);
	
	public int updatePassword(AccountVO account);
	
	public AccountVO getInformation(String account_num);
	
	public String getPassword(String account_num);
//	public updateInformationAttach
	public List<GeneralLikeListDTO> getListLikes(String account_num);
	
	public int updateLikeStatus(@Param("account_num") String account_num, @Param("e_num") String e_num);
	
	public List<GeneralMyReservationDTO> getListMyReservation(String account_num);
}
