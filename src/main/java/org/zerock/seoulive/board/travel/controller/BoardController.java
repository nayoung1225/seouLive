package org.zerock.seoulive.board.travel.controller;


import java.util.List;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.seoulive.board.travel.domain.BoardVO;
import org.zerock.seoulive.board.travel.domain.Criteria;
import org.zerock.seoulive.board.travel.domain.PageDTO;
import org.zerock.seoulive.board.travel.exception.ControllerException;
import org.zerock.seoulive.board.travel.service.BoardService;


@NoArgsConstructor
@Log4j2

@RequestMapping("/board/travel/*")
@Controller
public class BoardController {
    @Setter(onMethod_ = @Autowired)
    private BoardService service;

    // 게시판 목록조회
    @GetMapping("/list")
    public void list(Criteria cri, Model model) throws ControllerException {
        log.trace("list({}, {}) invoked.", cri, model);

        try {
            List<BoardVO> list = this.service.getList(cri);

            model.addAttribute("__LIST__",list);

            PageDTO pageDTO = new PageDTO(cri, this.service.getTotal(cri));
            model.addAttribute("pageMaker", pageDTO);
            model.addAttribute("list", service.getList(cri));
        } catch (Exception e) {
            throw new ControllerException(e);
        } // try-catch
    }

    @RequestMapping("/write")
    public String write() {

        return "board/travel/write";
    }

    @RequestMapping("/view")
    public String view() {

        return "board/travel/view";
    }
} // end class
