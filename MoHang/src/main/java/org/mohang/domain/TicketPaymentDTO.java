package org.mohang.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketPaymentDTO {
	private String ticket_payment_num;
	private String ticket_reservation_num;
	private String e_num;
	private String account_num;
	private String ticket_payment_method;
	private String ticket_payment_time;
	private int ticket_payment_price;
	private String ticket_payment_status;
	private String ticket_attend;
	
}
