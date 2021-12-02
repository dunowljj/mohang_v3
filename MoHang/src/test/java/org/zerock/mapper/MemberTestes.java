package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mohang.domain.AccountVO;
import org.mohang.mapper.AccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberTestes {
	@Autowired
	private AccountMapper accountMapper;
	
	/*@Test
	public void memberJoin() throws Exception{
		AccountVO account = new AccountVO();
		
		account.setAccountNum("tests");
		account.setAccountId("tests");
		account.setAccountPassword("tests");
		account.setAccountName("tsts");
		account.setAccountEmail("tests");
		account.setAccountAddress("tests");
		account.setAccountInterest("tests");
		account.setAccountGender("tests");
		account.setAccountPhonenumber("tests");
		
		accountMapper.memberJoin(account);
	}*/
	
	/*@Test
	public void accountIdChk() throws Exception{
		String id = "test";
		String id2 = "test1";
		
		accountMapper.idCheck(id);
		accountMapper.idCheck(id2);
	}*/
	
	@Test
	public void accountLogin() throws Exception{
		AccountVO account = new AccountVO();
		
		account.setAccount_id("1234");
		account.setAccount_password("1");
		
		//account.setAccount_id("12314");
		//account.setAccount_password("11");
		
		accountMapper.accountLogin(account);
		System.out.println("결과" + accountMapper.accountLogin(account));
	}
}
















