package org.mohang.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GeneralMyReservationDTO {
	private String account_num;
	private String account_name;
	private String account_phoneNumber;
	private String account_email;
	private String account_id;
	private String e_num;
	private String e_name;
	private Date e_applyDate;
	private Date e_startDate;
	private Date e_endDate;
	private String e_fname;
	private String eh_location;
	private int e_hitcount;
	private int ticket_reservation_amount;
	private String ticket_reservation_num;
	private String ticket_reservation_status;
	private int ticket_reservation_price;
	private String ticket_reservation_time;
	private String ticket_payment_status;
	private int ticket_payment_price;
	private String ticket_attend;
	private Date ticket_reservation_date;
	private String ticket_review_status;
	private Date review_date;
}
//