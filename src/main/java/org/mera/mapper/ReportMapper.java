package org.mera.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mera.domain.DauViewVO;
import org.mera.domain.GamePageViewVO;
import org.mera.domain.MemberCountStatVO;
import org.mera.domain.PageViewVO;
import org.mera.domain.SearchVO;

public interface ReportMapper {

	public List<MemberCountStatVO> getMemberCountStat();

	public List<PageViewVO> getPageView(@Param("search") SearchVO search);

	public List<GamePageViewVO> getGamePageView(@Param("search") SearchVO search);

	public List<DauViewVO> getDAUView(@Param("search") SearchVO search);

}
