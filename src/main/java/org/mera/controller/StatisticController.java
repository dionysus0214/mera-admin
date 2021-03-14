package org.mera.controller;

import org.mera.domain.*;
import org.mera.service.TestViewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/statistic/*")
public class StatisticController {

    private static final Logger logger = LoggerFactory.getLogger(StatisticController.class);

    private TestViewService service;

    //@Secured({"ROLE_ADMIN"})
    @GetMapping("/meraPageView")
    public void getPageView(HttpSession session, Model model) {
    }

    //@Secured({"ROLE_ADMIN"})
    @GetMapping("/meraDau")
    public void getDau(HttpSession session, Model model) {
        String menu = (String)session.getAttribute("menu");
        logger.info("getDau called = " + menu);
    }

    @GetMapping("/testView")
    public void getTestView(HttpSession session, Model model) {
    }

}
