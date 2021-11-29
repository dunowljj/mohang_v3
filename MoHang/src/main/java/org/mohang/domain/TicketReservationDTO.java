package org.mohang.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketReservationDTO {
	
	private String account_name;
	private Date ticket_reservation_time;
	private int ticket_reservation_price;
	private String ticket_reservation_status;
}