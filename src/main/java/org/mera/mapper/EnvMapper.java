package org.mera.mapper;

import java.util.List;

import org.mera.domain.EnvVO;

public interface EnvMapper {
    public List<EnvVO> getList();

    public EnvVO read(int seq);

    public void insert(EnvVO env);

    public int delete(int seq);

    public int update(EnvVO env);
}
