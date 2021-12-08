package org.mohang.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GeneralLikeListDTO {
	private String account_num;
	private String e_num;
	private String eh_location;
	private String e_name;
	private int e_hitcount;
	private Date e_endDate;
	private Date e_startDate;
	private Date e_startRecruiteDate;
	private Date e_endrecruiteDate;
	private String e_fname;
	private int e_price;
	private boolean like_status;
}
