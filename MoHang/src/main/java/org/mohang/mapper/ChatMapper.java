package org.mohang.mapper;

import java.util.List;

import org.mohang.domain.ChatVO;


public interface ChatMapper {
	List<ChatVO> listChat(String account_num);
	ChatVO oneChat();
}
