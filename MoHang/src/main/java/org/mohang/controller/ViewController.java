package org.mohang.controller;

import java.net.HttpCookie;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mohang.domain.AccountVO;
import org.mohang.domain.EventLikeDTO;
import org.mohang.domain.EventVO;
import org.mohang.domain.LikedVO;
import org.mohang.domain.Search;
import org.mohang.mapper.AdminMapper;
import org.mohang.mapper.EventMapper;
import org.mohang.service.AdminService;
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
	private AdminMapper adminMapper;
	@Autowired
	private EventMapper mapper;
	@Autowired
	private EventService eventService;
	@Autowired
	private AdminService adminService;
	/*
	 * 베스트 행사 -> 조회수가 많은 행사 상위 5개 출력
	 */
	@GetMapping("/best")
	public ResponseEntity<List<EventLikeDTO>> listBestEvent(HttpServletRequest request){
		log.info("list :"+eventService.listBestEvent(request));
		return new ResponseEntity<List<EventLikeDTO>> (eventService.listBestEvent(request),HttpStatus.OK);
	}
	/*
	 * 이달의 행사 -> 년 월로 조회수가 많은 행사 8개 출력
	 */
	@GetMapping("/month/{year}/{month}")
	public ResponseEntity<List<EventVO>> listMonthEvent(@PathVariable("year")String year, @PathVariable("month") String month){
		
		year = year.substring(2,4);
		month = String.format("%02d", Integer.parseInt(month));
		String search = year+"/"+month;
		log.info("search :"+ search);
		log.info("search :"+ eventService.listMonthEvent(search));
//		// List를 Set으로 변경
//		List<EventVO> list =eventService.listMonthEvent(search);
//		Set<EventVO> set = new HashSet<EventVO>(list);
//		// Set을 List로 변경
//		List<EventVO> newList =new ArrayList<EventVO>(set);
		return new ResponseEntity<List<EventVO>>(eventService.listMonthEvent(search),HttpStatus.OK);
	}
	/*
	 *	 월 ,일로 검색
	 */ 
	@GetMapping("/day/{month}/{date}/{year}")
	public ResponseEntity<List<EventVO>> listdayEvent(@PathVariable("month")String month, @PathVariable("date")String date,@PathVariable("year")String year){
		log.info("month :"+month+"date :"+ date);
		String search = year+"/"+month+"/"+date;
		log.info("service :"+eventService.listDayEvent(search));
		return new ResponseEntity<List<EventVO>>(eventService.listDayEvent(search),HttpStatus.OK);
	}
	/*
	 * 추천행사 -> 회원 관심 항목으로 검색 
	 */
	@PostMapping(value ="/recommend")
	public ResponseEntity<List<EventLikeDTO>> bestEvent(HttpServletRequest request){
		log.info("recommend :"+ eventService.listRecommendEvent(request));
		
		return new ResponseEntity<List<EventLikeDTO>>(eventService.listRecommendEvent(request),HttpStatus.OK);
	}
}
