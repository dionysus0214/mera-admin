package org.mera.controller;

import org.mera.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.Locale;
import java.util.Map;

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
