package org.mera.service;

import lombok.AllArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.mera.domain.MemberVO;
import org.mera.mapper.MemberMapper;
import org.springframework.stereotype.Service;


@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

    //@Inject
    private SqlSession session;

    //@Inject
    // spring 4.3 이상에서는 @AllArgsConstructor 설정으로 자동생성
    private MemberMapper memberMapper;

    @Override
    public MemberVO login(String userName) {
        return memberMapper.login(userName);
    }

}
