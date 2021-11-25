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
	 * 베스트 행사 출력 -> 조회수가 많은 행사 상위 5개
	 */
	@GetMapping("/list")
	public ResponseEntity<List<EventVO>> listEvent(){
		return new ResponseEntity<> (service.listEvent(),HttpStatus.OK);
	}
	/*
	 * 이달의 행사 -> 
	 */
	@GetMapping("/month/{year}/{month}")
	public ResponseEntity<List<EventVO>> listMonthEvent(@PathVariable("year")String year, @PathVariable("month") String month){
		year = year.substring(2,4);
		String search = year+"/"+month;
		log.info(service.listMonthEvent(search));
		
		return new ResponseEntity<List<EventVO>>(service.listMonthEvent(search),HttpStatus.OK);
	}
}
