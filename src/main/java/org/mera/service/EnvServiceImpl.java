package org.mera.service;

import java.util.List;

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
    public List<EnvVO> getList() {
        logger.info("get List.....");
        return mapper.getList();
    }
}
