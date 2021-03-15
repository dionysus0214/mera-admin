package org.mera.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.mera.domain.TestViewVO;
import org.mera.service.TestViewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/testView/*")
public class TestViewController {

    private static final Logger logger = LoggerFactory.getLogger(TestViewController.class);

    private TestViewService service;

    // @GetMapping("/register")
    // public void register() {}

    @GetMapping("/list")
    public void list(Model model) {

		List<TestViewVO> list = service.getList();
        for( int i=0; i<list.size(); i++ ) {
            logger.info(i + "=" + list.get(i));
        }

        model.addAttribute("list", list);

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
