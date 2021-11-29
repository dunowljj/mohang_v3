package org.mohang.controller;

import java.net.HttpCookie;
import java.util.Date;
import java.util.List;

import org.mohang.domain.EventVO;
import org.mohang.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/view")
@Log4j
public class ViewController {
	@Autowired
	private EventService eventService;
	/*
	 * 베스트 행사 -> 조회수가 많은 행사 상위 5개 출력
	 */
	@GetMapping("/best")
	public ResponseEntity<List<EventVO>> bestEvent(){
		log.info(eventService.listBestEvent());
		return new ResponseEntity<> (eventService.listBestEvent(),HttpStatus.OK);
	}
	/*
	 * 이달의 행사 -> 년 월로 조회수가 많은 행사 3개 출력
	 */
	@GetMapping("/month/{year}/{month}")
	public ResponseEntity<List<EventVO>> listMonthEvent(@PathVariable("year")String year, @PathVariable("month") String month){
		
		year = year.substring(2,4);
		String search = year+"/"+month;
		log.info("search :"+ search);
		return new ResponseEntity<List<EventVO>>(eventService.listMonthEvent(search),HttpStatus.OK);
	}
	/*
	 *	 월 ,일로 검색
	 */
	@GetMapping("/day/{month}/{date}")
	public ResponseEntity<List<EventVO>> listdayEvent(@PathVariable("month")String month, @PathVariable("date")String date){
		log.info("month :"+month+"date :"+ date);
		String search = month+"/"+date;
		log.info("service :"+eventService.listMonthEvent(search));
		return new ResponseEntity<List<EventVO>>(eventService.listMonthEvent(search),HttpStatus.OK);
	}
	/*
	 * 추천행사 -> 회원 관심 항목으로 검색 
	 */
	@PostMapping(value ="/recommend")
	public ResponseEntity<List<EventVO>> bestEvent(String account_Interest){
		
		log.info("account_Interest :"+account_Interest);
		log.info("추천 행사 :"+eventService.listRecommendEvent(account_Interest));
		return new ResponseEntity<List<EventVO>>(eventService.listRecommendEvent(account_Interest),HttpStatus.OK);
		
	}
}
