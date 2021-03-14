package org.mera.service;

import org.mera.domain.*;
import org.mera.dto.LoginDTO;

import java.util.Date;
import java.util.List;

public interface TestViewService {

	// public void register(TestViewVO board);

	// public TestViewVO get(Long bno);

	// public boolean modify(TestViewVO board);

	// public boolean remove(Long bno);

	public List<TestViewVO> getList();
	
	// public List<TestViewVO> getList(Criteria cre);

	// public int getTotal(Criteria cri);
	
}