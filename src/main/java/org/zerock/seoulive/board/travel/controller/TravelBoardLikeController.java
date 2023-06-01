package org.zerock.seoulive.board.travel.controller;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.seoulive.board.travel.domain.TravelBoardLikeDTO;
import org.zerock.seoulive.board.travel.exception.ControllerException;
import org.zerock.seoulive.board.travel.service.BoardService;
import org.zerock.seoulive.board.travel.service.TravelBoardLikeService;

@NoArgsConstructor
@Log4j2

@RequestMapping("/board/travel/*")
@Controller
public class TravelBoardLikeController {

    @Autowired
    private TravelBoardLikeService boardLikeService;

    public TravelBoardLikeController(TravelBoardLikeService boardLikeService) {
        this.boardLikeService = boardLikeService;
    }

//    @PostMapping("/likeList")
//    public ResponseEntity<String> like (TravelBoardLikeDTO dto) {
//        try {
//            boardLikeService.boardLike(dto);
//
//            // 성공적인 응답 반환
//            return new ResponseEntity<>("찜 처리가 완료되었습니다.", HttpStatus.OK);
//        } catch (Exception e) {
//            e.printStackTrace();
//
//            // 오류 발생 시 예외 처리
//            return new ResponseEntity<>("찜 처리 중 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
//
//        }
//    }

    @PostMapping("/likeList")
    void likeList(TravelBoardLikeDTO dto) throws ControllerException {
        try {

            this.boardLikeService.boardLike(dto);

        } catch(Exception e) {
            e.getStackTrace();
            throw new ControllerException(e);

        } //try-catch
    }

} // TravelBoardLikeController
