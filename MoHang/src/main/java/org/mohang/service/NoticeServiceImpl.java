package org.mohang.service;

import java.util.List;

import org.mohang.domain.NoticeVO;
import org.mohang.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	NoticeMapper mapper;
	@Override
	public List<NoticeVO> getNotice() {
		return mapper.getNotice();
	}

}
