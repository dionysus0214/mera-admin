package org.mera.service;

import org.mera.domain.*;
import org.mera.dto.LoginDTO;

import java.util.Date;
import java.util.List;

/**
 * Created by User on 2016-06-09.
 */
public interface ReportService {

    public List<MemberCountStatVO> getMemberCountStat() throws Exception;

    public List<PageViewVO> getPageView(SearchVO search) throws Exception;
    public List<GamePageViewVO> getGamePageView(SearchVO search) throws Exception;

    public List<DauViewVO> getDAUView(SearchVO search) throws Exception;
}
