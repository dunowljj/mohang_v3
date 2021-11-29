package org.mohang.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GeneralLikeListDTO {
	private String eh_location;
	private String e_name;
	private int e_hitcount;
	private Date e_startRecruiteDate;
	private boolean like_status;
	private String e_fname;
	private int e_price;
}
