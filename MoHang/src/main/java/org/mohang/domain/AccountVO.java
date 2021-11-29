package org.mohang.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class AccountVO {
	//general db column;
	private String accountNum;
	private String accountId;
	private String accountPassword;
	private String accountName;
	private String accountEmail;
	private String accountAddress;
	private String accountAddress2;
	private String accountAddress3;
	private Date accountJoindate;
	private int accountMileage;
	private String accountInterest;
	private Date accountBirthdate;
	private String accountGender;
	private String accountPhonenumber;	
}
