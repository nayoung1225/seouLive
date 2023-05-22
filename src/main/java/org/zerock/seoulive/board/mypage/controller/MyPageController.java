package org.zerock.seoulive.board.mypage.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/mypage/*")
public class MyPageController {

    @RequestMapping("/view")
    public String myPage(){ return "/board/mypage/view"; }
} // MyPageController
