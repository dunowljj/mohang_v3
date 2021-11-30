package org.mohang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StatisticsDTO {
	private String account_num;
	private String account_interest;
	private int account_Age;
	private String account_gender;
	private int ticket_reservation_amount;
	private String e_num;
	private int e_hitCount;
	private int e_like;
	private int reservation ;
	private double ratioReservation;
	private double rationReservationCancel;
}
