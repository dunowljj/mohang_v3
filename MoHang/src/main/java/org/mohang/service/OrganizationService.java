package org.mohang.service;

import org.mohang.domain.OrganizationVO;
import org.springframework.stereotype.Service;




public interface OrganizationService {
	public int insertOrganization(OrganizationVO organizationVO);
	public OrganizationVO getOrganization(String account_num);
	public int updateOrganization(OrganizationVO organization);
}
