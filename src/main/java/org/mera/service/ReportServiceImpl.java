package org.mera.service;

import java.util.List;

import org.mera.domain.DauViewVO;
import org.mera.domain.GamePageViewVO;
import org.mera.domain.MemberCountStatVO;
import org.mera.domain.PageViewVO;
import org.mera.domain.SearchVO;
import org.mera.domain.TestViewVO;
import org.mera.mapper.ReportMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

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
