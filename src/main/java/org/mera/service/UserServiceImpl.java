package org.mera.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

/**
 * Created by User on 2016-06-09.
 */
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    //@Inject
    private SqlSession session;

    //@Inject
    // spring 4.3 �씠�긽�뿉�꽌�뒗 @AllArgsConstructor �꽕�젙�쑝濡� �옄�룞�깮�꽦
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
