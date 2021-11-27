package org.mohang.mapper;

import org.mohang.domain.OrganizationVO;

public interface OrganizationMapper {
	//xml의 sql문을 메서드로 만든것
	public int insertOrganization(OrganizationVO organization);
	public OrganizationVO getOrganization(String account_num);
	public int updateOrganization(OrganizationVO organization);
}