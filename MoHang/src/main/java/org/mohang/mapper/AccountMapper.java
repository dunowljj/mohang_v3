package org.mohang.mapper;

import org.apache.ibatis.annotations.Param;
import org.mohang.domain.AccountVO;
import org.mohang.domain.OrganizationVO;

public interface AccountMapper {
	//회원가입
	public void memberJoin(AccountVO account);
	//가입시 기본 파일 로우 생성
	public int memberJoinAttach(String account_num);
	
	
	//아이디 중복 검사
	public int idCheck(String account_id);
	
	
	//로그인 체크
	public void loginCheck(@Param("account_login") String account_login, @Param("account_num") String account_num);
	
	//로그인
	public AccountVO accountLogin(AccountVO account);
	//단체 정보
	public OrganizationVO o_numCheck(String account_num);
}
