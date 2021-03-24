package org.mera.controller;

import org.mera.domain.EnvVO;
import org.mera.service.EnvService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String list(Model model) throws Exception {
        logger.info("list");
		model.addAttribute("list", service.getList());

        return "/env/listTableAjax";
    }

    @GetMapping("/get")
    public void get(@RequestParam("seq") int seq, Model model) {
        logger.info("/get");
        model.addAttribute("env", service.get(seq));
    }

    @GetMapping("/register")
    public void register() {
    }

    @PostMapping("/register")
    public String register(EnvVO env, RedirectAttributes rttr) {
        logger.info("register : " + env);
        service.register(env);
        rttr.addFlashAttribute("result", env.getSeq());

        return "redirect:/env/list";
    }

    @PostMapping("/modify")
    public String modify(EnvVO env, RedirectAttributes rttr) {
        logger.info("modify : " + env);

        if (service.modify(env)) {
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:/env/list";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("seq") int seq, RedirectAttributes rttr) {
        logger.info("remove : " + seq);

        if (service.remove(seq)) {
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:/env/list";
    }

}
