package org.mohang.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApproveDTO {
	private String ap_num; //행사승인번호 (조인공통)
	private String e_name;
	private String admin_num;
	private Date ap_date;
	private String ap_check;
	private String eh_reservation_num;
	private String e_num;
	
}
