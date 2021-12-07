package org.mohang.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewCommentDTO {
	private String review_comment_num;
	private String review_num; //글번호
	private String account_num;//작성자번호
	
	private String review_comment_content;//댓글내용
	private Date review_comment_date;//댓글날자
	private String account_id;
}
