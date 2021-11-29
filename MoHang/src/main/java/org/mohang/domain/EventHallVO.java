package org.mohang.domain;

import lombok.Data;

@Data
public class EventHallVO {
	private String eh_num;//행사장 번호
	private String eh_name;//행사자 이름
	private String eh_location;//행사장 위치
	private String eh_price;//행사장 대관료
	private String eh_range;//행사장 규모
	private String eh_image;//행사장 이미지
	private String eh_detail;//행사장 상세정보
	private String eh_command;//행사장 수용
}
