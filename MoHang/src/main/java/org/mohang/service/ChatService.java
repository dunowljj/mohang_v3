package org.mohang.service;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.ChatVO;

public interface ChatService {

	//채팅 대상 목록
	public List<AccountVO> getList(String account_num);
	//채팅 내역 
	public List<ChatVO> getChatList(String room_num);

}
