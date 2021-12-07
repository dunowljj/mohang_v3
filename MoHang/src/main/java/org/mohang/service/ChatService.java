package org.mohang.service;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.ChatDTO;
import org.mohang.domain.ChatVO;

public interface ChatService {

	//채팅 대상 목록
	public List<ChatDTO> getList(String account_num);
	//채팅 내역 
	public List<ChatVO> getChatList(String room_num);
	//채팅 내용 추가
	public int addChatLog(ChatVO chatVO);
	
	//메시지 전부삭제
	public int deleteChatLog(String room_num);
	
	//채팅방 유저
	public int deleteUser(String room_num);
	
	//채팅방 삭제
	public int deleteRoom(String room_num);
}
