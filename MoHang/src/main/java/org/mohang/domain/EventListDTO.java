package org.mohang.domain;



import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventListDTO {

	private String e_num;
	private String o_num;
	private String eh_num;
	private String account_num;
	private String e_name;
	private Date e_startDate;
	private Date e_endDate;
	private Date e_applyDate;
	private String ap_check;
}
