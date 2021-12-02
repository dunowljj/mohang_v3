package org.zerock.mapper;

import static org.junit.Assert.*;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mohang.domain.AccountVO;
import org.mohang.domain.TicketPaymentDTO;
import org.mohang.domain.TicketReservationDTO;
import org.mohang.mapper.GeneralMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class GeneralMapperTests {


//	@Test
//	public void testExist(){
//		
//		log.info(service);
//		assertNotNull(service);
//	}
	@Setter(onMethod_ = @Autowired)
	private GeneralMapper mapper;
//	
//	@Test
//	public void test() {
//		AccountVO vo;
//		log.info(vo = mapper.getInformation("A-2"));
//	}
//	@Test
//	public void testInsertReserve() {
////		String start_dt = "2011-01-01";
////
////		DateFormat formatter = new SimpleDateFormat("YYYY-MM-DD"); 
////		Date date = null;
////		try {
////			date = (Date)formatter.parse(start_dt);
////		} catch (ParseException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		}
//		
//		
//		TicketReservationDTO reservDTO = new TicketReservationDTO();
////		#{ticket_reservation_num}, #{e_num}, #{account_num},
////		#{ticket_reservation_price}, #{ticket_reservation_amount},
////		'예약완료', #{ticket_reservation_time}
//		reservDTO.setTicket_reservation_amount(2);
////		reservDTO.setTicket_reservation_date("95-01-22");
//		reservDTO.setTicket_reservation_num("1");
//		reservDTO.setTicket_reservation_price(2000);
//		reservDTO.setTicket_reservation_status("예약완료");
//		reservDTO.setTicket_reservation_time("지금이순간");
//		reservDTO.setE_num("1");
//		reservDTO.setAccount_num("1");
//		log.info(mapper.insertTicketReserv(reservDTO));
//	}
	@Test
	public void testInsertPay() {
		TicketPaymentDTO payDTO = new TicketPaymentDTO("1", "1", "1", "2", "카드", "지금 결제했어", 20000, "결제완료", "미참여");
		log.info(mapper.insertTicketPay(payDTO, "28"));
	}
}