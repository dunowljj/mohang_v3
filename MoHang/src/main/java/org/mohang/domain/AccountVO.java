package org.mohang.domain;

import java.sql.Date;  

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
	private String account_address2;
	private String account_address3;
	private Date account_joindate;
	private int account_mileage;
	private String account_interest;
	private Date account_birth_date;
	private String account_gender;
	private String account_phoneNumber;	
	private String account_Delete;	
}
