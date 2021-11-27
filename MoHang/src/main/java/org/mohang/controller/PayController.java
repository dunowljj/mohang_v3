package org.mohang.controller;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/jq/*")
public class PayController {

//	@Autowired
	
	@GetMapping("/jq.cls")
	public String kakaoAcess(){
		log.info("@@@@@@@@@@@@@@@@@@@@kakaopage Access@@@@@@@@@@@@@@");
		return "/module/general/kakao";
	}
	//pay practice
	@PostMapping("/kakaopay")
	@ResponseBody
	public String kakaoPay(){
		log.info("@@@@@@@@@@@@@@@@@@@@kakaoPay Access@@@@@@@@@@@@@@");

		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connectServer = (HttpURLConnection) address.openConnection();
			connectServer.setRequestMethod("POST");
			connectServer.setRequestProperty("Authorization", "KakaoAK f55c99822eea51f491680c4aeebb6d65");
			connectServer.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connectServer.setDoOutput(true);
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=https://developers.kakao.com/success&fail_url=https://developers.kakao.com/fail&cancel_url=https://developers.kakao.com/cancel";
			OutputStream outputStream = connectServer.getOutputStream();
			DataOutputStream dataStream = new DataOutputStream(outputStream); 
			dataStream.writeBytes(param);
			log.info("@@@@@@@@@@@@@@@@@"+param);
//			dataStream.flush();
			dataStream.close();
			
			int result = connectServer.getResponseCode();
			
			log.info("@@@@@@@@@@@@@@@@@"+result);
			InputStream inputStream;
			if(result == 200){
				inputStream = connectServer.getInputStream();
			} else{
				inputStream = connectServer.getErrorStream();
			}
			InputStreamReader inputReader = new InputStreamReader(inputStream);
//			BufferedReader br = new BufferedReader(inputReader);
//			return br.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "{\"result\":\"NO\"}";
	}

}