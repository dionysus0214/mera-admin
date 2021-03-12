package org.mera.service;

import lombok.AllArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.mera.domain.MemberVO;
import org.mera.mapper.UserMapper;
import org.springframework.stereotype.Service;
import org.mera.domain.UserVO;
import org.mera.dto.LoginDTO;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by User on 2016-06-09.
 */
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    //@Inject
    private SqlSession session;

    //@Inject
    // spring 4.3 이상에서는 @AllArgsConstructor 설정으로 자동생성
//    private UserMapper userMapper;
//
//    private static final String NAMESPACE = "org.mera.mapper.UserMapper";
//
//    @Override
//    public UserVO login(LoginDTO dto) throws Exception {
//        return userMapper.login(dto);
//    }
//
//    @Override
//    public void keepLogin(String uid, String sessionId, Date next) throws Exception {
//        Map<String, Object> paramMap = new HashMap<>();
//        paramMap.put("uid", uid);
//        paramMap.put("sessionId", sessionId);
//        paramMap.put("next", next);
//
//        session.update(NAMESPACE+".keepLogin", paramMap);
//    }
//
//    @Override
//    public UserVO checkLoginBefore(String key) {
//        return userMapper.checkUserWithSessionKey(key);
//    }

}
