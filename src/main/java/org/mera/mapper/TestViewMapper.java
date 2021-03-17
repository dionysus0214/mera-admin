package org.mera.mapper;

import java.util.List;

import org.mera.domain.Criteria;
import org.mera.domain.TestViewVO;

public interface TestViewMapper {

  public List<TestViewVO> getList();

  public List<TestViewVO> getListWithPaging(Criteria cri);

  public int getTotalCount(Criteria cri);

}
