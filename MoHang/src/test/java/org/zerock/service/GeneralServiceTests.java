package org.zerock.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mohang.domain.AccountVO;
import org.mohang.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class GeneralServiceTests {

	@Setter(onMethod_ = @Autowired)
	private GeneralService service;
	
	@Test
	public void test() {
		AccountVO vo = service.getInformation("A-2");
		log.info(vo);
	}

}
