package org.mohang.domain;

import lombok.Data;

@Data
public class GeneralAttachFileVO {
	
	private String accountImg_uuid;
	private String accountImg_uploadPath;
	private String accountImg_fileName;
	private boolean accountImg_image;
	
	private String account_num;
}
