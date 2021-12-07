package org.mohang.service;

import org.apache.ibatis.annotations.Param;
import org.mohang.domain.AccountVO;

public interface AccountService {
	
	//회원가입
	public void memberJoin(AccountVO account) throws Exception;
	
	//아이디 중복 검사
	public int idCheck(String account_id) throws Exception;
	
	//로그인체크
	public void loginCheck(String account_login,  String account_num);
	
	//로그인
	public AccountVO accountLogin(AccountVO account) throws Exception;
	//단체 정보 체크 
	public boolean o_numCheck(String account_num);
	
}
