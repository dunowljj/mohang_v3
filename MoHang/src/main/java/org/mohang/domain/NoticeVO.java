package org.mohang.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVO {
	private String notice_num;
	private String admin_num;
	private String notice_title;
	private String notice_writer;
	private int notice_hitcount;
	private String notice_content;
	private Date notice_date;
}
