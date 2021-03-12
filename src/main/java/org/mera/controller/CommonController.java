package org.mera.controller;

import org.mera.domain.UserVO;
import org.mera.dto.LoginDTO;
import org.mera.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

@Controller
public class CommonController {
    private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

    @Inject
    private UserService service;

    //@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
    @GetMapping("/")
    public String home(Locale locale, Model model) {
        logger.info("Welcome home! The client locale is {}.", locale);

//        Date date = new Date();
//        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//
//        String formattedDate = dateFormat.format(date);
//
//        model.addAttribute("serverTime", formattedDate);

        return "redirect:/main";
    }

    @GetMapping("/main")
    @PreAuthorize("isAuthenticated()")
    public void main(HttpSession session, Model model) {
        Map map = model.asMap();
        logger.info("model = ", map.toString());

        String menu = (String)session.getAttribute("menu");

        logger.info("dashboard called = " + menu);
    }

    @GetMapping("/accessError")
    public String accessDenied(Authentication auth, Model model) {
        logger.info("access Denied : " + auth);
        return "/error/accessError";
    }

    @RequestMapping(value = "/customLogin", method = RequestMethod.GET)
    public void login(HttpSession session, String error, String logout, Model model) throws Exception {
        logger.info("error: " + error);
        logger.info("logout: " + logout);

        if( error != null ) {
            model.addAttribute("error", "Login Error Check You Account");
        }

        if( logout != null ) {
            model.addAttribute("logout", "Logout !!!");
        }

//        String menu = "googlereport";
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String returnValue2 = passwordEncoder.encode("wishMobile1q2w");
        logger.info("password = " + returnValue2);
//
//        UserVO vo = service.login(dto);
//
//        if(vo != null) {
//            if( passwordEncoder.matches(dto.getUpw(), vo.getUpw()) == true ) {
//
//                model.addAttribute("userVO", vo);
//                model.addAttribute("menu", menu);
//
//                if (dto.isUseCookie()) {
//                    //int amount = 60 * 60 * 24 * 7;
//                    int amount = 60 * 60 * 24;
//                    Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
//                    service.keepLogin(vo.getUid(), session.getId(), sessionLimit);
//                }
//            }
//        }

    }

    @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
    public void loginPOST(LoginDTO dto, HttpSession session, String error, String logout, Model model) throws Exception {
        String menu = "googlereport";

        if( error != null ) {
            model.addAttribute("error", "Login Error Check Yout Account");
        }

        if( logout != null ) {
            model.addAttribute("logout", "Logout !!!");
        }
//
//        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//
//        UserVO vo = service.login(dto);
//
//        if(vo != null) {
//            if( passwordEncoder.matches(dto.getUpw(), vo.getUpw()) == true ) {
//
//                model.addAttribute("userVO", vo);
//                model.addAttribute("menu", menu);
//
//                if (dto.isUseCookie()) {
//                    //int amount = 60 * 60 * 24 * 7;
//                    int amount = 60 * 60 * 24;
//                    Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
//                    service.keepLogin(vo.getUid(), session.getId(), sessionLimit);
//                }
//            }
//        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        Object obj = session.getAttribute("login");
//        if(obj != null) {
//            UserVO vo = (UserVO) obj;
//
//            session.removeAttribute("login");
//            session.invalidate();
//
//            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
//
//            if(loginCookie != null) {
//                loginCookie.setPath("/");
//                loginCookie.setMaxAge(0);
//                response.addCookie(loginCookie);
//                service.keepLogin(vo.getUid(), session.getId(), new Date());
//            }
//        }

        return "customLogin";
    }
}
