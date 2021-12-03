package org.mohang.mapper;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.ChatVO;


public interface ChatMapper {
	List<AccountVO> listChat(String account_num);
	List<ChatVO> listMessage(String room_num);
}
