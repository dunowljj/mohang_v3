package org.mohang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatDTO {
	private String account_num;
	private String account_name;
	private String room_num;
	private String admin_num;
	private String account_login;
}
