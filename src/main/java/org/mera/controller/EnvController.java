package org.mera.controller;

import org.mera.service.EnvService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/env/*")
@AllArgsConstructor
public class EnvController {
    private static final Logger logger = LoggerFactory.getLogger(EnvController.class);

    private EnvService service;

    @GetMapping("/list")
	public void listTable(Model model) throws Exception {
	}

    @PostMapping("/list")
    public String list(Model model) throws Exception {
        logger.info("list");
		model.addAttribute("list", service.getList());

        return "/env/listTableAjax";
    }

}
