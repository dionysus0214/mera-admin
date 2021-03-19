package org.mera.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/dashboard/*")
public class DashboardController {

    private static final Logger logger = LoggerFactory.getLogger(DashboardController.class);

    //@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
    @GetMapping("/googleReport")
    public void dashboard(HttpSession session, Model model) {
    }

    //@Secured({"ROLE_ADMIN"})
    @GetMapping("/meraReport")
    public void meraReport(HttpSession session, Model model) {
    }
}
