package org.mohang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StatisticsDetailDTO {
	//아니 잠깐만 여기 무슨내용이 와야하는거지..?
	private int ticket_reservation_amount;
	private String ticket_reservation_status;
	private String e_num;

}
