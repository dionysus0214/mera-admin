package org.mera.service;

import lombok.AllArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.mera.controller.ReportController;
import org.mera.domain.*;
import org.mera.dto.LoginDTO;
import org.mera.mapper.ReportMapper;
import org.mera.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by User on 2016-06-09.
 */
@Service
@AllArgsConstructor
public class ReportServiceImpl implements ReportService {

    private static final Logger logger = LoggerFactory.getLogger(ReportServiceImpl.class);

    private ReportMapper mapper;

    @Override
    public List<MemberCountStatVO> getMemberCountStat() throws Exception {
        return mapper.getMemberCountStat();
    }

    @Override
    public List<PageViewVO> getPageView(SearchVO search) throws Exception {
        return mapper.getPageView(search);
    }

    @Override
    public List<GamePageViewVO> getGamePageView(SearchVO search) throws Exception {
        return mapper.getGamePageView(search);
    }

    @Override
    public List<DauViewVO> getDAUView(SearchVO search) throws Exception {
        return mapper.getDAUView(search);
    }
}
