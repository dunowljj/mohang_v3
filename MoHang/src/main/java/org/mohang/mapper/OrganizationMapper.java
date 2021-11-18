package org.mohang.mapper;

import org.mohang.domain.OrganizationVO;

public interface OrganizationMapper {
	//xml의 sql문을 메서드로 만든것
	int organizationInsert(OrganizationVO organization);

}