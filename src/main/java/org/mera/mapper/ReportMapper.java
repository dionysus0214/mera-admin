package org.mera.mapper;

import org.apache.ibatis.annotations.Param;
import org.mera.domain.*;
import org.mera.dto.LoginDTO;

import java.util.Date;
import java.util.List;

public interface ReportMapper {

    public List<MemberCountStatVO> getMemberCountStat();

    public List<PageViewVO> getPageView(@Param("search") SearchVO search);
    public List<GamePageViewVO> getGamePageView(@Param("search") SearchVO search);

    public List<DauViewVO> getDAUView(@Param("search") SearchVO search);
}
