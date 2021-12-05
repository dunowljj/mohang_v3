package org.mohang.domain;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketReservationDTO {
	
	private String ticket_reservation_num;
	private String e_num;
	private String account_name;
	private String account_num;
	private Date ticket_reservation_time;
	private int ticket_reservation_price;
	private String ticket_reservation_status;
	private int ticket_reservation_amount;
	private Date ticket_reservation_date;
}
