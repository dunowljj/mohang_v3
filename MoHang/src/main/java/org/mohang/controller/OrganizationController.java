package org.mohang.controller;

import org.mohang.domain.OrganizationVO;
import org.mohang.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/organization/*")
public class OrganizationController  {
	
	@Autowired
	OrganizationService service;
	
	//단체정보신청페이지
	@GetMapping("/applyForm")
	public String applyForm(){
		log.info("---Organization's apply form Page---");
		return "module/organization/applyForm";
	}
	
//단체정보신청
	@PostMapping("/insertOrganization")
	public String insertOrganization(OrganizationVO organizationVO, RedirectAttributes rttr){
		//잘못입력했을때기존값 가지고 넘어가는 방법
		if(service.insertOrganization(organizationVO)==-1){
			return "module/login/login.jsp";
		};
		log.info("insert Success");
		return "module/event/insertForm";
	}
	
	//단체정보조회
	@GetMapping("/getOrganization")
	public String getOrganization(String account_num, Model model){
		//OrganizationVO organizationVO = service.getOrganization(account_num);
		OrganizationVO organizationVO = service.getOrganization("121");
		model.addAttribute("organization", organizationVO);
		return "module/organization/informationUpdateForm";
	}
	
	
	
	//단체정보업데이트페이지
	@GetMapping("/informationUpdateForm")
	public String informationUpdateForm(){
		log.info("---Organization's information update form Page---");
		return "module/organization/informationUpdateForm";
	}
	
	//단체정보업데이트
	@PostMapping("/updateOrganization")
	public String updateOrganization(OrganizationVO organizationVO, RedirectAttributes rttr){
		service.updateOrganization(organizationVO);
		log.info("update Success");
		return "module/event/applyForm";
	}
}

