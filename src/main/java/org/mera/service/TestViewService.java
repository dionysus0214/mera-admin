package org.mera.service;

import java.util.List;

import org.mera.domain.Criteria;
import org.mera.domain.TestViewVO;

public interface TestViewService {
	
	public List<TestViewVO> getList(Criteria cre);

	public int getTotal(Criteria cri);
	
}