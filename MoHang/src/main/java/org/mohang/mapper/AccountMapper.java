package org.mohang.mapper;

import org.mohang.domain.AccountVO;
import org.mohang.domain.OrganizationVO;

public interface AccountMapper {
	//회원가입
	public void memberJoin(AccountVO account);
	
	//아이디 중복 검사
	public int idCheck(String account_id);
	
	//로그인
	public AccountVO accountLogin(AccountVO account);
	//단체 정보
	public OrganizationVO o_numCheck(String account_num);
}
