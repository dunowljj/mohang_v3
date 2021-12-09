package org.mohang.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.mohang.domain.ExcelDTO;
import org.mohang.domain.StatisticsAgeDTO;
import org.mohang.domain.StatisticsInterestDTO;
import org.mohang.domain.StatisticsScopeDTO;
import org.mohang.service.EventService;
import org.mohang.service.ExcelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/eventRest")
@Log4j
@AllArgsConstructor
public class EventRestController {

	@Autowired
	EventService eventService;


	@GetMapping("/statisticsListDetail/{e_num}")
	public ResponseEntity<List<StatisticsAgeDTO>> getAgeGender(@PathVariable("e_num") String e_num) {
		log.info("----rest----");
		return new ResponseEntity<>(eventService.getStatistics_ageGender(e_num), HttpStatus.OK);
	}

	@GetMapping("/statisticsListDetail_scope/{e_num}")
	public ResponseEntity<List<StatisticsScopeDTO>> getScope(@PathVariable("e_num") String e_num) {
		log.info("----get scope----");
		return new ResponseEntity<>(eventService.getReviewScope(e_num), HttpStatus.OK);
	}

	@GetMapping("/statisticsListDetail_interest/{e_num}") /// {e_num은 }.getJson으로 받기
	public ResponseEntity<List<StatisticsInterestDTO>> getInterst(@PathVariable("e_num") String e_num) {
		return new ResponseEntity<>(eventService.getStatistics_interest(e_num), HttpStatus.OK);
	}

	
}