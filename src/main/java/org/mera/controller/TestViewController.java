package org.mera.controller;

import org.mera.domain.Criteria;
import org.mera.domain.PageMaker;
import org.mera.service.TestViewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/testView/*")
@AllArgsConstructor
public class TestViewController {

	private static final Logger logger = LoggerFactory.getLogger(TestViewController.class);

	private TestViewService service;

	@GetMapping("/list")
	public void list(Model model) throws Exception {
	}

	@PostMapping("/list")
	public String list(Criteria cri, Model model) throws Exception {
		logger.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);
		logger.info("total: " + total);
		model.addAttribute("pageMaker", new PageMaker(cri, total));

		return "/testView/listTableAjax";
	}
}
