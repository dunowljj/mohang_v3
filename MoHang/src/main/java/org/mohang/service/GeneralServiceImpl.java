package org.mohang.service;

import org.mohang.domain.AccountVO;
import org.mohang.mapper.GeneralMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class GeneralServiceImpl implements GeneralService {

	@Autowired
	private GeneralMapper mapper;
	
	@Override
	public AccountVO getInformation(String account_num) {
		
		return mapper.getInformation(account_num);
	}

	@Override
	public boolean updateInformation(AccountVO accountVO) {
		return mapper.updateInformation(accountVO) == 1;
	}

}
