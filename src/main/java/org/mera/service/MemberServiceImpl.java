package org.mera.service;

import org.apache.ibatis.session.SqlSession;
import org.mera.domain.MemberVO;
import org.mera.mapper.MemberMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

    //@Inject
    private SqlSession session;

    private MemberMapper memberMapper;

    @Override
    public MemberVO login(String userName) {
        return memberMapper.login(userName);
    }

}
