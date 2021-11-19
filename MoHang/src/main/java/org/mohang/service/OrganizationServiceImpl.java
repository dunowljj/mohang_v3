package org.mohang.service;

import org.mohang.domain.GeneralVO;
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
		//로그인 된 회원의 번호를 가져오는 방식으로 변경해야함
		//if(로그인 안되면 ){
		// return -1;
		//}
		//organizationVO.setAccount_num(account.getAccount_num());

		organizationVO.setAccount_num("223");
		
		return organizationMapper.insertOrganization(organizationVO);
	}

	@Override
	public OrganizationVO getOrganization(String account_num) {
		
		return organizationMapper.getOrganization(account_num);
	}

	@Override
	public int updateOrganization(OrganizationVO organization) {
		return organizationMapper.updateOrganization(organization);
	}
	
	

}
