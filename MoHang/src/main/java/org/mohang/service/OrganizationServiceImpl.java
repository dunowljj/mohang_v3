package org.mohang.service;

//import org.mohang.domain.GeneralVO;
import org.mohang.domain.OrganizationVO;
import org.mohang.mapper.OrganizationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrganizationServiceImpl implements OrganizationService {
	
	@Autowired
	private OrganizationMapper organizationMapper;
/*	@Autowired
	private GeneralVO account;
	*/
	@Override
	public int insertOrganization(OrganizationVO organizationVO) {
	
		//organizationVO.setAccount_num(account.getAccount_num());

		organizationVO.setAccount_num("223");
		
		return organizationMapper.insertOrganization(organizationVO);
	}

	@Override
	public OrganizationVO getOrganization(String account_num) {
		
		return organizationMapper.getOrganization(account_num);
	}

	@Override
	public int updateOrganization(OrganizationVO organizationVO) {
		
		
		return organizationMapper.updateOrganization(organizationVO);
	}
	/*
	 * 충돌 조심
	 * (non-Javadoc)
	 * @see org.mohang.service.OrganizationService#getOrgainzationOnum(java.lang.String)
	 */
	@Override
	public OrganizationVO getOrganizationOnum(String o_num) {
		return organizationMapper.getOrganizationOnum(o_num);
	}
	
	

}
