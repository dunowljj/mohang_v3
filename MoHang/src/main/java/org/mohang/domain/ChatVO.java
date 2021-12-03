package org.mohang.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatVO {
	private String chat_index;
	private String room_num;
	private String account_num;
	private String admin_num;
	private String chat_history;
	private Date chat_date;
}
