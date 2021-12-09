package org.mohang.service;

import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.ChatDTO;
import org.mohang.domain.ChatVO;
import org.mohang.domain.RoomVO;
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
	public List<ChatDTO> getList(String account_num) {
		log.info("채팅목록 불러오기............." );
		return mapper.listChat(account_num);
	}

	@Override
	public List<ChatVO> getChatList(String room_num) {
		// TODO Auto-generated method stub
		return mapper.listMessage(room_num);
	}

	@Override
	public int addChatLog(ChatVO chatVO) {
		// TODO Auto-generated method stub
		return mapper.addMessage(chatVO);
	}

	@Override
	public int deleteChatLog(String room_num) {
		// TODO Auto-generated method stub
		return mapper.deleteMessage(room_num);
	}

	@Override
	public int deleteUser(String room_num) {
		// TODO Auto-generated method stub
		return mapper.deleteChat(room_num);
	}

	@Override
	public int deleteRoom(String room_num) {
		// TODO Auto-generated method stub
		return mapper.deleteRoom(room_num);
	}

	@Override
	public void addchatList(String account_num ,String writerAccount_num) {
		String room_num="";
		
		RoomVO roomVO = new RoomVO();
		
		roomVO.setAccount_num(account_num);
		roomVO.setAdmin_num("0");
		
		//나를 채팅방에 추가 
		if(mapper.addRoom(roomVO) == 1) {
			room_num = roomVO.getRoom_num();
			mapper.addUser(roomVO);
			roomVO.setAccount_num(writerAccount_num);
			roomVO.setRoom_num(room_num);
			log.info("내 채팅 들어왔다@@@@@@@@@");
			//상대방을 채팅방에 넣어줌
			if(mapper.addUser(roomVO) == 1) {
				log.info("상대방 채팅 들어왔다@@@@@@@@@");
			}
		}
		 
		
		
	}

	@Override
	public String getWriterAccount_num(String o_num) {
		
		return mapper.getAddUserAccountNum(o_num);
	}

}
