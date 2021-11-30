package org.mohang.service;

import org.mohang.domain.AccountVO;
import org.mohang.mapper.AccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	AccountMapper accountMapper;
	
	@Override
	public void memberJoin(AccountVO account) throws Exception {
		accountMapper.memberJoin(account);
		
	}

	@Override
	public int idCheck(String account_id) throws Exception {
		return accountMapper.idCheck(account_id);
	}

	
}
