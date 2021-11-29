package org.mohang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GeneralPasswordVO {
	
	private String password;
	private String password1;
	private String password2;
}
