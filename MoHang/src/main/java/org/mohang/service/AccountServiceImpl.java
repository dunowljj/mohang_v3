package org.mohang.service;

import org.apache.ibatis.annotations.Param;
import org.mohang.domain.AccountVO;
import org.mohang.mapper.AccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	AccountMapper accountMapper;
	
	@Transactional
	@Override
	public void memberJoin(AccountVO account) throws Exception {
		accountMapper.memberJoin(account);
		accountMapper.memberJoinAttach(account.getAccount_num());
		
	}

	@Override
	public int idCheck(String account_id) throws Exception {
		return accountMapper.idCheck(account_id);
	}

	@Override
	public AccountVO accountLogin(AccountVO account) throws Exception {
		return accountMapper.accountLogin(account);
	}

	@Override
	public boolean o_numCheck(String account_num) {
		// TODO Auto-generated method stub
		return accountMapper.o_numCheck(account_num)!=null;
	}

	@Override
	public void loginCheck(String account_login,  String account_num){
		// TODO Auto-generated method stub
		accountMapper.loginCheck(account_login,account_num);
	}

	
	
}
