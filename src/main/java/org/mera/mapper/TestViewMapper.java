package org.mera.mapper;

import org.apache.ibatis.annotations.Param;
import org.mera.domain.*;
import org.mera.dto.LoginDTO;

import java.util.Date;
import java.util.List;

public interface TestViewMapper {

  public List<TestViewVO> getList();

//   public List<TestViewVO> getListWithPaging(Criteria cri);

//   public void insert(TestViewVO board);

//   public Integer insertSelectKey(TestViewVO board);

//   public TestViewVO read(Long bno);

//   public int delete(Long bno);

//   public int update(TestViewVO board);

//   public int getTotalCount(Criteria cri);
}
