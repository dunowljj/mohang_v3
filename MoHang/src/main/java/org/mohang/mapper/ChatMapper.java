package org.mohang.mapper;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.ChatDTO;
import org.mohang.domain.ChatVO;


public interface ChatMapper {
	List<ChatDTO> listChat(String account_num);
	List<ChatVO> listMessage(String room_num);
	int addMessage(ChatVO chatVO);
	int deleteChat(String room_num);
	int deleteMessage(String room_num);
	int deleteRoom(String room_num);
}
