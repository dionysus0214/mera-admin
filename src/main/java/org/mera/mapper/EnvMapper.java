package org.mera.mapper;

import java.util.List;

import org.mera.domain.Criteria;
import org.mera.domain.EnvVO;

public interface EnvMapper {
    public List<EnvVO> getList();

    public List<EnvVO> getListWithPaging(Criteria cri);

    public EnvVO read(int seq);

    public void insert(EnvVO env);

    public int delete(int seq);

    public int update(EnvVO env);

    public int getTotalCount(Criteria cri);
}
