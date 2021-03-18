package org.mera.controller;

import org.mera.domain.SearchVO;
import org.mera.service.ReportService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/report/*")
@AllArgsConstructor
public class ReportController {

    private static final Logger logger = LoggerFactory.getLogger(ReportController.class);

    private ReportService service;

    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
    @PostMapping("/memberCountStat")
    public void memberCountStat(Model model) throws Exception {
        logger.info("/report/memberCountStat");

        model.addAttribute("list", service.getMemberCountStat());
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
    @PostMapping(value = "/pageView")
    public String pageView(Model model, SearchVO search) throws Exception {

        logger.info("startDate = " + search.getStartDate());
        logger.info("endDate = " + search.getEndDate());

        model.addAttribute("list", service.getPageView(search));

        return "/statistic/pageViewAjax";
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
    @PostMapping(value = "/gamePageView")
    public String gamePageView(Model model, SearchVO search) throws Exception {

        logger.info("startDate = " + search.getStartDate());
        logger.info("endDate = " + search.getEndDate());

        model.addAttribute("list", service.getGamePageView(search));

        return "/statistic/gamePageViewAjax";
    }

    //@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
    @PostMapping(value = "/getDAU")
    public String dauView(Model model, SearchVO search) throws Exception {

        logger.info("startDate = " + search.getStartDate());
        logger.info("endDate = " + search.getEndDate());

        model.addAttribute("list", service.getDAUView(search));

        return "/statistic/dauViewAjax";
    }

//    @PostMapping(value = "/pageView", params={"startDate", "endDate"})
//    public String pageView(String startDate, String endDate, Model model) throws Exception {
//
//        logger.info("startDate = ", startDate);
//        logger.info("endDate = ", endDate);
//
//        if( startDate.length() <= 0) {
//            return null;
//        }
//
//        model.addAttribute("list", service.getPageView());
//
//        return "/dashboard/pageViewAjax";
//    }
}
