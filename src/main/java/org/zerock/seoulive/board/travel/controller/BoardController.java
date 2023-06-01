package org.zerock.seoulive.board.travel.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.zerock.seoulive.board.travel.domain.BoardDTO;
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
//    @ResponseBody
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


    // 카테고리 검색
    @GetMapping("/search")
    public void categorySelect(Criteria cri,Model model, BoardDTO dto) throws ControllerException {
        log.trace("list({}) invoked.", cri, model);

        try {
            BoardDTO boardDTO = null;
            List<BoardDTO> list = (List<BoardDTO>) this.service.categorySelect(dto);

            model.addAttribute("__CATEGORY__", list);

//            boardDTO = new BoardDTO(this.service.categorySelect(BoardDTO dto));
//            model.addAttribute("list", service.categorySelect(BoardDTO));
        } catch (Exception e) {
            throw new ControllerException(e);
        } // try-catch
    }


    // 날짜 데이터 받아오기
    @RequestMapping(value = "/board/travel/listByDate", method = RequestMethod.GET)
    @ResponseBody
    public List<String> processClickedDate(@RequestParam("selectedDate")
                                       String selectedDate, Model model)
                                        throws ControllerException {
        try {
            // selectedDate에서 년, 월, 일을 추출
            String[] dateParts = selectedDate.split("-");
            int year = Integer.parseInt(dateParts[0]);
            int month = Integer.parseInt(dateParts[1]);
            int day = Integer.parseInt(dateParts[2]);

            List<String> searchList = getSearchList(); // 실제 검색 대상 리스트를 얻는 메서드 호출

            List<String> selectDate = new ArrayList<>();
            for (String item : searchList) {
                // 항목에서 년도, 월, 일을 추출하여 검색 조건과 비교
                String[] itemParts = item.split("-");
                int itemYear = Integer.parseInt(itemParts[0]);
                int itemMonth = Integer.parseInt(itemParts[1]);
                int itemDay = Integer.parseInt(itemParts[2]);

                if (itemYear == year && itemMonth == month && itemDay == day) {
                    selectDate.add(item);
                }
            }

            model.addAttribute("selectDate", selectedDate); // EL 변수를 모델에 추가

            return selectDate;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ControllerException(e);
        }
    }

    // 실제 검색 대상 리스트를 반환하는 메서드
    private List<String> getSearchList() {
        List<String> searchList = new ArrayList<>();
        // 검색 대상 리스트를 얻는 로직을 구현
        // 예시로 임의의 데이터를 추가
        searchList.add("2023-05-23");
        searchList.add("2023-05-24");
        searchList.add("2023-05-25");
        return searchList;
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
