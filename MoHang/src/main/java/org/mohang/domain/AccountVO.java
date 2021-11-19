package org.mohang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountVO {
	//general db column;
	private String account_num;
	private String account_id;
	private String account_password;
	private String account_name;
	private String account_email;
	private String account_address;
	private String account_join_date;
	private String account_interest;
	private String account_img;
	private String account_gender;
	private int account_age;
	private int account_mileage;	
}
