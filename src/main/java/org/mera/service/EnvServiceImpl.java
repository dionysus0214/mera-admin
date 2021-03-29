package org.mera.service;

import java.util.List;

import org.mera.domain.Criteria;
import org.mera.domain.EnvVO;
import org.mera.mapper.EnvMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class EnvServiceImpl implements EnvService {
    private static final Logger logger = LoggerFactory.getLogger(EnvServiceImpl.class);

    private EnvMapper mapper;

    @Override
    public List<EnvVO> getList(Criteria cri) {
        logger.info("get List with criteria : " + cri);
        return mapper.getListWithPaging(cri);
    }

    @Override
    public EnvVO get(int seq) {
        logger.info("get : " + seq);
        return mapper.read(seq);
    }

    @Override
    public void register(EnvVO env) {
        logger.info("register : " + env);
        mapper.insert(env);
    }

    @Override
    public boolean remove(int seq) {
        logger.info("remove : " + seq);
        return mapper.delete(seq) == 1;
    }

    @Override
    public boolean modify(EnvVO env) {
        logger.info("modify : " + env);
        return mapper.update(env) == 1;
    }

    @Override
    public int getTotal(Criteria cri) {
        logger.info("get total count");
        return mapper.getTotalCount(cri);
    }
}
