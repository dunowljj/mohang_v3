package org.mohang.controller;

import org.mohang.domain.Search;
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
    @GetMapping("searchform")
    public String GetsearchForm(Search search, Model model){
    	String field = search.getField();
    	String type = search.getType();
    	String price = search.getPrice();
    	
    	field =field.replace(",", " ");
        return "module/search/searchform";
    }
    @PostMapping("searchform")
    public String postSearchForm(Search search, Model model ){
    	String field = search.getField();
    	String type = search.getType();
    	String price = search.getPrice();
    	String keyword = search.getKeyword();
    	model.addAttribute("search.field", field);
    	model.addAttribute("search.type", type);
    	model.addAttribute("search.price", price);
    	model.addAttribute("search.keyword", keyword);
    	System.out.println(search.toString());
    	return "module/search/searchform";
    }
}
