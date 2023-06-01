package org.zerock.seoulive.board.travel.service;


import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.seoulive.board.travel.domain.BoardDTO;
import org.zerock.seoulive.board.travel.domain.BoardVO;
import org.zerock.seoulive.board.travel.domain.Criteria;
import org.zerock.seoulive.board.travel.domain.TravelBoardLikeDTO;
import org.zerock.seoulive.board.travel.exception.ServiceException;
import org.zerock.seoulive.board.travel.mapper.BoardMapper;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

import java.util.List;
import java.util.Objects;

@NoArgsConstructor
@Log4j2


@Service("boardService")
public class BoardServiceImpl
        implements
        BoardService,
        InitializingBean,
        DisposableBean {

    @Setter(onMethod_ = {@Autowired})
    private BoardMapper dao;	// 영속성 계층의 DAO 빈 주입받음

    // 1. 게시판 목록 얻어 반환해주는 기능 수행
    @Override
    public List<BoardVO> getList(Criteria cri) throws ServiceException {
        log.trace("\n\t getList() invoked.");

        try {
            return this.dao.selectList(cri);
        } catch(Exception e ) {
            throw new ServiceException(e);
        } // try-catch
    }	//	getList

    @Override
    public Boolean register(BoardDTO dto) throws ServiceException {
        return null;
    }

    @Override
    public BoardVO get(Integer seq) throws ServiceException {
        return null;
    }

    @Override
    public Boolean modify(BoardDTO dto) throws ServiceException {
        return null;
    }

    @Override
    public Boolean remove(Integer writer) throws ServiceException {
        return null;
    }

    @Override
    public Integer getTotal(Criteria cri) throws ServiceException {
        return this.dao.getTotalAmount(cri);
    } // getTotal

    @Override
    public void boardLike(TravelBoardLikeDTO likeDTO) {

    }


    @Override
    public void destroy() throws Exception {
        log.trace("\n\t destroy() invoked.");

    } // destroy

    @Override
    public void afterPropertiesSet() throws Exception {

        log.trace("\n\t afterPropertiesSet() invoked.");

//		assert this.dao != null;
        Objects.requireNonNull(this.dao);
        log.info("\n\t this.dao : {} ",dao);

    }

    @Override
    // 카테고리 검색
    public Object categorySelect(BoardDTO boardDTO) throws ServiceException{

        try {
            this.dao.categorySelect(boardDTO);
        } catch(Exception e ) {
            throw new ServiceException(e);
        } // try-catch
        return null;
    }



} // end class
