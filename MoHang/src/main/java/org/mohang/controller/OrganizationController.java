package org.mohang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mohang.domain.OrganizationVO;
import org.mohang.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String insertOrganization(HttpServletRequest request,OrganizationVO organizationVO, RedirectAttributes rttr ){
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("account_num");
		String account_num = (String)obj;
		
		organizationVO.setAccount_num(account_num);
		if(service.insertOrganization(organizationVO)==-1){
			return "module/login/login.jsp";
		};
		log.info("insert Success");
		rttr.addAttribute("o_num", organizationVO.getO_num()); 
		return "redirect:/event/insertForm";
	}
	
	//단체정보조회
	/*회원의 번호로 단체를 조회해야할것같음.*/
	@GetMapping("/getOrganization")
	public String getOrganization(HttpServletRequest request, Model model){
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("account_num");
		String account_num = (String)obj;
		
		OrganizationVO organizationVO = service.getOrganization(account_num);
		log.info("--get Organization--");
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
		log.info("--update Success--");
		return "redirect:/organization/getOrganization";
	}
}

