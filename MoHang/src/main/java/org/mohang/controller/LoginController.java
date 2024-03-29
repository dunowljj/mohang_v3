package org.mohang.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mohang.domain.AccountVO;
import org.mohang.service.AccountService;
//import org.mohang.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpOutputMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/login/*")
@Log4j
public class LoginController{
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//회원가입 get
	@GetMapping("/join")
	public String joinGET(){
		log.info("회원가입 페이지 진입");
		return "module/login/join";
	}
	
	//회원가입 post
	@PostMapping("/join")
	public String joinPost(AccountVO account) throws Exception{
		log.info("join진입");
		account.setAccount_login("0");
		account.setAccount_delete("Y");
		accountService.memberJoin(account);
		log.info("서비스 성공");
		return "redirect:/Main";
	}
	
	//아이디 중복 검사
	@PostMapping("/accountIdChk")
	@ResponseBody
	public String accountIdChkPOST(String account_id) throws Exception{
		log.info("체크 진입");
		int result = accountService.idCheck(account_id);
		log.info("결과" + result);
		if (result != 0) {

			return "fail"; // 중복 아이디가 있음

		} else {

			return "success"; // 중복 아이디 없음
			
		}	
	}
	
	//이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
		log.info("이메일 데이터 전송");
		log.info("인증번호" + email);
		
		//난수
		Random random = new Random();
		int checkNum = random.nextInt(88888) + 11111;
		log.info("인증번호" + checkNum);
		
		//이메일 보내기
		String setFrom = "zhsks9707@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
        				"저희 MoHang 홈페이지 회원가입을 진심으로 축하드립니다." +
        				"<br><br>" +
        				"회원가입에 필요한 인증번호는" + checkNum + "입니다." +
        				"<br><br>" +
        				"인증번호를 입력 후 회원가입을 진행해주세요." +
        				"<br><br>" +
        				"빠이~";
        
		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String num = Integer.toString(checkNum);
		return num;
	}
	
	//로그인 get
	@GetMapping("/login")
	public String loginGET(){
		log.info("로그인 페이지 진입");
		return "module/login/login";
	}
	
	//로그인
	@PostMapping("/login")
	public String loginPOST(HttpServletRequest request, AccountVO account, RedirectAttributes rttr) throws Exception{
		System.out.println("로그인 진입");
		System.out.println("데이터" + account);
		
		HttpSession session = request.getSession();
		AccountVO lvo = accountService.accountLogin(account);
		//회원 번호로 단체 테이블 조회
		if(lvo == null) { //일치하지 않는 아이디, 비밀번호 입력 경우
			int result = 0;
			rttr.addFlashAttribute("result", result);
			session.setAttribute("account_num", "0");
			return "redirect:/login/login";
		}else{
			//로그인
			boolean check = accountService.o_numCheck(lvo.getAccount_num());
			//없는거
			if(check){
				session.setAttribute("check", "false");
			//있는거 
			}else{
				session.setAttribute("check", "true");
			}
			session.setAttribute("account", lvo);
			session.setAttribute("account_num", lvo.getAccount_num());
			accountService.loginCheck("1",lvo.getAccount_num());
		}
		
		
		
		return "redirect:/Main";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logoutMainGET(HttpServletRequest request) throws Exception{
		log.info("로그아웃");
		HttpSession session = request.getSession();
		String account_num = (String)session.getAttribute("account_num");
		accountService.loginCheck("0",account_num);
		session.invalidate();
		return "redirect:/Main";
	}
	
	
}

















