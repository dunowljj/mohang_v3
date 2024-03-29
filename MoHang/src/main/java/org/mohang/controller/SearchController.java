package org.mohang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mohang.domain.EventLikeDTO;
import org.mohang.domain.EventVO;
import org.mohang.domain.PageDTO2;
import org.mohang.domain.Search;
import org.mohang.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/search")
@Log4j
public class SearchController  {
	@Autowired
    EventService eventService;
    @PostMapping("searchform")
    public String postSearchForm(@ModelAttribute("search")  Search search,Model model,HttpServletRequest request){
    	
    	search =search.replace(search);
    	List<EventLikeDTO> list =eventService.listEvent(search,request);
    	log.info("search :"+search);
    	log.info("list :"+eventService.listEvent(search,request));
    	int total = eventService.getTotalCount(search);
    	model.addAttribute("total", total);
    	model.addAttribute("list", eventService.listEvent(search,request));
    	model.addAttribute("pageMaker", new PageDTO2 (search,total));
    	return "/module/search/searchform";
    }
    @GetMapping("searchform")
    public String getSearchForm(@ModelAttribute("search") Search search,Model model,HttpServletRequest request){
    	search =search.replace(search);
    	List<EventLikeDTO> list =eventService.listEvent(search,request);
    	
    	log.info("list :"+list);
    	log.info("get :"+search);
    	int total = eventService.getTotalCount(search);
    	model.addAttribute("total", total);
    	model.addAttribute("list", eventService.listEvent(search,request));
    	model.addAttribute("pageMaker", new PageDTO2 (search,total));
    	return "/module/search/searchform";
    }
    @PostMapping("secondsearch")
    public String postSecondSearch(@ModelAttribute("search") Search search, Model model,HttpServletRequest request){
    	search =search.replace(search);
    	log.info("search :" +search);
    	log.info("list :"+eventService.listEvent(search,request));
    	int total = eventService.getTotalCount(search);
    	model.addAttribute("total", total);
    	model.addAttribute("list", eventService.listEvent(search,request));
    	model.addAttribute("pageMaker", new PageDTO2 (search,total));
    	return "/module/search/searchform";
    }
}
