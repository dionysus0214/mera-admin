package org.mera.service;

import java.util.List;

import org.mera.domain.Criteria;
import org.mera.domain.EnvVO;

public interface EnvService {
    public List<EnvVO> getList(Criteria cri);

    public EnvVO get(int seq);

    public void register(EnvVO env);

    public boolean remove(int seq);

    public boolean modify(EnvVO env);

    public int getTotal(Criteria cri);
}
