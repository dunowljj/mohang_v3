package org.mohang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GeneralAttachFileDTO {

	private String account_uuid;
	private String account_path;
	private String account_fileName;
	private boolean account_fileType;
	
}
