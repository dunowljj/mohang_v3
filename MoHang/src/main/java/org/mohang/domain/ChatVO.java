package org.mohang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatVO {

	private String chat_num;
	private String room_num;
	private String account_num;
	private String chat_history;
	private String chat_time;

}
