package org.mera.security;

import org.mera.domain.MemberVO;
import org.mera.mapper.MemberMapper;
import org.mera.security.domain.CustomUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;

public class CustomUserDetailsService implements UserDetailsService {

    private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);

    @Setter(onMethod_ = { @Autowired })
    private MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

        logger.warn("Load User By UserName : " + userName);

        // userName means userid
        MemberVO vo = memberMapper.login(userName);

        logger.warn("queried by member mapper: " + vo);

        return vo == null ? null : new CustomUser(vo);
    }

}
