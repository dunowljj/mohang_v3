package org.mohang.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ApproveVO {
	private String ap_num;
	private String admin_num;
	private Date ap_date;
	private String ap_check;
	private String eh_reservation_num;
}
