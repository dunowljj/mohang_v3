package org.mohang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GeneralResPayTimeDTO {
	private String S_ticket_reservation_time;
	private String S_ticket_payment_time;
}
