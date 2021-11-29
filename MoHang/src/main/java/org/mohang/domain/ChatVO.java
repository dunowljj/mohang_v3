package org.mohang.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatVO {

	private String chat_num;
	private String room_num;
	private String chat_history;
	private Date chat_time;

}
