package org.mera.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by User on 2016-06-09.
 */
@Controller
@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_GIANKING')")
@RequestMapping("/gyanking")
public class gyankingController {

    private static final Logger logger = LoggerFactory.getLogger(gyankingController.class);

    @RequestMapping(value = "/gyanMainList", method = RequestMethod.GET)
    public void gyanMainList(HttpSession session, Model model) throws Exception {

    }

    @RequestMapping(value = "/gyanDetailView", method = RequestMethod.GET)
    public void gyanDetailView(HttpSession session, Model model) throws Exception {

    }
}
