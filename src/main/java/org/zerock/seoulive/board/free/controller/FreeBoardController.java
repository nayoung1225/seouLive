package org.zerock.seoulive.board.free.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/free/*")
public class FreeBoardController {


    @RequestMapping("/list")
    public String list() {
        return "board/free/list";
    }
}
