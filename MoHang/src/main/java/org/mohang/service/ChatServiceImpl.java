package org.mohang.service;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.ChatVO;
import org.mohang.mapper.ChatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatMapper mapper;
	@Override
	public List<AccountVO> getList(String account_num) {
		log.info("채팅목록 불러오기............." );
		return mapper.listChat(account_num);
	}

	@Override
	public List<ChatVO> getChatList(String room_num) {
		// TODO Auto-generated method stub
		return mapper.listMessage(room_num);
	}

}
