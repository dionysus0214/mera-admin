package org.mera.service;

import java.util.List;

import org.mera.domain.DauViewVO;
import org.mera.domain.GamePageViewVO;
import org.mera.domain.MemberCountStatVO;
import org.mera.domain.PageViewVO;
import org.mera.domain.SearchVO;

/**
 * Created by User on 2016-06-09.
 */
public interface ReportService {

    public List<MemberCountStatVO> getMemberCountStat() throws Exception;

    public List<PageViewVO> getPageView(SearchVO search) throws Exception;
    public List<GamePageViewVO> getGamePageView(SearchVO search) throws Exception;

    public List<DauViewVO> getDAUView(SearchVO search) throws Exception;
}
