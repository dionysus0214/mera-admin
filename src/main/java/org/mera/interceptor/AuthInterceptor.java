package org.mera.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mera.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * Created by User on 2016-06-09.
 */
public class AuthInterceptor extends HandlerInterceptorAdapter{

    private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

    @Inject
    private UserService service;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        String uri = request.getRequestURI();
        String query = request.getQueryString();

        session.setAttribute("menu", uri);

        logger.info("interceptor uri = " + uri + "," + query);
//        if(session.getAttribute("login") == null) {
//            logger.info("======================================鍮꾩씤媛��맂 �젒洹쇱엯�땲�떎.=========================================");
//            saveDest(request);
//
//            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
//            if(loginCookie != null) {
//                UserVO vo = service.checkLoginBefore(loginCookie.getValue());
//                logger.info("UserVO :"+vo);
//                if(vo != null) {
//                    session.setAttribute("login", vo);
//                    return true;
//                }
//            }
//            response.sendRedirect("/login");
//            return false;
//        }
        return true;
    }

    private void saveDest(HttpServletRequest req) {
        String uri = req.getRequestURI();
        String query = req.getQueryString();
        if(query == null || query.equals("null")) {
            query = "";
        } else {
            query = "?"+query;
        }

        if(req.getMethod().equals("GET")) {
            logger.info("=======================DEST : "+(uri+query)+"===============================");
            req.getSession().setAttribute("dest", uri+query);
        }

    }

}
