package org.mohang.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Event_Hall_ReservationVO {
	private String eh_reservation_num;
	private Date eh_reservation_date;
	private String e_num;
	private String account_num;
}
