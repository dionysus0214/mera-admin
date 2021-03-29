package org.mera.controller;

import org.mera.domain.Criteria;
import org.mera.domain.EnvVO;
import org.mera.domain.PageMaker;
import org.mera.service.EnvService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/env/*")
@AllArgsConstructor
public class EnvController {
    private static final Logger logger = LoggerFactory.getLogger(EnvController.class);

    private EnvService service;

    @GetMapping("/list")
    public void listFirst(Model model) throws Exception {
    }

    @PostMapping("/list")
    public String list(Criteria cri, Model model) throws Exception {
        logger.info("list: " + cri);
        model.addAttribute("list", service.getList(cri));

        int total = service.getTotal(cri);
        logger.info("total: " + total);
        model.addAttribute("pageMaker", new PageMaker(cri, total));

        return "/env/listTableAjax";
    }

    @GetMapping("/register")
    public void register() {
    }

    @PostMapping("/register")
    @ResponseBody
    public String register(EnvVO env) {
        logger.info("register: " + env);
        service.register(env);

        return "success";
    }

    @GetMapping("/modify")
    public void get(@RequestParam("seq") int seq, Model model) {
        logger.info("modify");
        model.addAttribute("env", service.get(seq));
    }

    @PostMapping("/modify")
    @ResponseBody
    public String modify(EnvVO env) {
        logger.info("modify: " + env);
        service.modify(env);

        return "success";
    }

    @PostMapping("/remove")
    @ResponseBody
    public String remove(@RequestParam("seq") int seq) {
        logger.info("remove: " + seq);
        service.remove(seq);

        return "success";
    }

}
