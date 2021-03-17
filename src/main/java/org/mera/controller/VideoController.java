package org.mera.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by User on 2016-06-09.
 */
@Controller
@RequestMapping("/video")
public class VideoController {

//    @Inject
//    private UserService service;

    @RequestMapping(value = "/videoList", method = RequestMethod.GET)
    public void videoList(HttpSession session, Model model) throws Exception {

    }
}
