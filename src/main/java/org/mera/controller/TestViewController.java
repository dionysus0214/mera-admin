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

@Controller
@RequestMapping("/statistic/testView/*")
public class TestViewController {

    private TestViewService service;

    // @GetMapping("/register")
    // public void register() {}

    @GetMapping("/list")
    public void list(Model model) {

        model.addAttribute("list", service.getList());

    }

    // @GetMapping("/list")
    // public void list(Criteria cri, Model model) {

    //     log.info("list: " + cri);
    //     model.addAttribute("list", service.getList(cri));
    //     model.addAttribute("pageMaker", new PageDTO(cri, 123));

    //     int total = service.getTotal(cri);

    //     log.info("total: " + total);

    //     model.addAttribute("pageMaker", new PageDTO(cri, total));

    // }

    // @PostMapping("/register")
    // public String register(BoardVO board, RedirectAttributes rttr) {

    //     log.info("register: " + board);

    //     service.register(board);

    //     rttr.addFlashAttribute("result", board.getBno());

    //     return "redirect:/board/list";
    // }

    // @GetMapping({"/get", "/modify"})
    // public void get(
    //     @RequestParam("bno")Long bno,
    //     @ModelAttribute("cri")Criteria cri,
    //     Model model
    // ) {

    //     log.info("/get or modify");
    //     model.addAttribute("board", service.get(bno));
    // }

    // @PostMapping("/modify")
    // public String modify(
    //     BoardVO board,
    //     @ModelAttribute("cri")Criteria cri,
    //     RedirectAttributes rttr
    // ) {
    //     log.info("modify:" + board);

    //     if (service.modify(board)) {
    //         rttr.addFlashAttribute("result", "success");
    //     }

    //     rttr.addAttribute("pageNum", cri.getPageNum());
    //     rttr.addAttribute("amount", cri.getAmount());
    //     rttr.addAttribute("type", cri.getType());
    //     rttr.addAttribute("keyword", cri.getKeyword());

    //     return "redirect:/board/list";
    // }

    // @PostMapping("/remove")
    // public String remove(@RequestParam("bno")Long bno, RedirectAttributes rttr) {

    //     log.info("remove..." + bno);
    //     if (service.remove(bno)) {
    //         rttr.addFlashAttribute("result", "success");
    //     }
    //     return "redirect:/board/list";
    // }

}
