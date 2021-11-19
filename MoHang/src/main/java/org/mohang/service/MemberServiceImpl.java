package org.mohang.service;

import org.mohang.domain.MemberVO;
import org.mohang.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberMapper memberMapper;

	@Override
	public void memberJoin(MemberVO member) throws Exception {
		memberMapper.memberJoin(member);
		
	}
	
	
}
