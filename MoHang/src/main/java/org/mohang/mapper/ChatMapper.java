package org.mohang.mapper;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.ChatDTO;
import org.mohang.domain.ChatVO;
import org.mohang.domain.RoomVO;


public interface ChatMapper {
	List<ChatDTO> listChat(String account_num);
	List<ChatVO> listMessage(String room_num);
	int addMessage(ChatVO chatVO);
	int deleteChat(String room_num);
	int deleteMessage(String room_num);
	int deleteRoom(String room_num);
	int addRoom(RoomVO roomVO);
	int addUser(RoomVO roomVO);
	String getAddUserAccountNum(String o_num);
	void test();
}
