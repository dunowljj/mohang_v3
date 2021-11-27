package org.mohang.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountVO {
	private String account_num;
	private String account_id;
	private String account_password;
	private String account_name;
	private String account_email;
	private String account_address;
	private Date account_join_Date;
	private int account_mileage;
	private String  account_interest;
	private String account_account_Img;
	private String account_birth_date;
	private String account_gender;
	private String account_phoneNumber;
	
}
