package org.mohang.mapper;

import org.mohang.domain.GeneralAttachFileDTO;
import org.mohang.domain.GeneralAttachFileVO;

public interface GeneralAttachMapper {
	public int updateInformationAttach(GeneralAttachFileVO attachVO);

	public GeneralAttachFileDTO getInformationAttach(String account_num);
}
