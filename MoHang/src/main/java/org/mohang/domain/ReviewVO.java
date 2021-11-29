package org.mohang.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
	private String review_num;
	private String account_num;
	private String review_title;
	private String review_writer;
	private String review_content;
	private Date review_date;
	private int review_hitcount;
	private String review_scope; //별점
}
