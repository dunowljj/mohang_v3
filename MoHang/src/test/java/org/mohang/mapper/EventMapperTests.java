package org.mohang.mapper;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mohang.domain.AccountVO;
import org.mohang.domain.EventLikeDTO;
import org.mohang.domain.EventVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class EventMapperTests {
	@Setter(onMethod_ = @Autowired)
	private EventMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private AdminMapper adminMapper;
	
	@Test
	public void listRecommendEvent() {
		List<String> test= new ArrayList<>();
		test.add("test");
		mapper.listRecommendEvent(test);
	}
}
