package org.zerock.seoulive.board.travel.service;


import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.seoulive.board.travel.domain.BoardDTO;
import org.zerock.seoulive.board.travel.domain.BoardVO;
import org.zerock.seoulive.board.travel.domain.Criteria;
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
        return this.dao.getTotalAmount();
    }

    @Override
    public List<BoardVO> getListByDate(String selectedDate) {
        // selectedDate를 활용하여 해당 날짜에 맞는 목록 데이터를 조회하는 로직을 구현합니다.
        // 예시로 임시로 빈 리스트를 반환하도록 작성했습니다.
        return dao.selectListByDate(selectedDate);
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



} // end class
