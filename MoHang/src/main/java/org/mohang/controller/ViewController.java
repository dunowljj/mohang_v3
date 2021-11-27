package org.mohang.controller;

import java.net.HttpCookie;
import java.util.Date;
import java.util.List;

import org.mohang.domain.EventVO;
import org.mohang.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/view")
@Log4j
public class ViewController {
	@Autowired
	private EventService service;
	/*
	 * 베스트 행사 -> 조회수가 많은 행사 상위 5개 출력
	 */
	@GetMapping("/list")
	public ResponseEntity<List<EventVO>> listEvent(){
		log.info(service.listEvent());
		return new ResponseEntity<> (service.listEvent(),HttpStatus.OK);
	}
	/*
	 * 이달의 행사 -> 년 월로 조회수가 많은 행사 3개 출력
	 */
	@GetMapping("/month/{year}/{month}")
	public ResponseEntity<List<EventVO>> listMonthEvent(@PathVariable("year")String year, @PathVariable("month") String month){
		
		year = year.substring(2,4);
		String search = year+"/"+month;
		
		return new ResponseEntity<List<EventVO>>(service.listMonthEvent(search),HttpStatus.OK);
	}
	/*
	 *	 일로 검색
	 */
	@GetMapping("/day/{month}/{date}")
	public ResponseEntity<List<EventVO>> listdayEvent(@PathVariable("month")String month, @PathVariable("date")String date){
		log.info("month :"+month+"date :"+ date);
		String search = month+"/"+date;
		log.info("service :"+service.listMonthEvent(search));
		return new ResponseEntity<List<EventVO>>(service.listMonthEvent(search),HttpStatus.OK);
	}
	/*
	 * 추천행사 ->
	 */
	@GetMapping("/best/{account_Interest}")
	public ResponseEntity<List<EventVO>> bestEvent(@PathVariable("account_Interest") String account_Interest){
		log.info("test");
		log.info("account_Interest :"+account_Interest);
		return null;
		
	}
}
