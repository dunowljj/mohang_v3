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
public class MemberVO {
	private String accountNum;
	private String accountId;
	private String accountPassword;
	private String accountName;
	private String accountEmail;
	private String accountAddress;
	private Date joinDate;
	private int milleage;
	private String interset;
	private String accountImg;
	private int age;
	private String gender;
	
}
