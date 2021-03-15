package org.mera.service;

import java.util.List;

import org.mera.domain.Criteria;
import org.mera.domain.TestViewVO;
import org.mera.mapper.TestViewMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class TestViewServiceImpl implements TestViewService {

	private static final Logger logger = LoggerFactory.getLogger(TestViewServiceImpl.class);

	private TestViewMapper mapper;

	@Override
	public List<TestViewVO> getList(Criteria cri) {
		logger.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}
		
	@Override
	public int getTotal(Criteria cri) {
		logger.info("get total count");
		return mapper.getTotalCount(cri);
	}
}