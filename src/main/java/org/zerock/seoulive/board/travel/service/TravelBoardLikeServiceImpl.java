package org.zerock.seoulive.board.travel.service;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.seoulive.board.travel.domain.TravelBoardLikeDTO;
import org.zerock.seoulive.board.travel.exception.ServiceException;
import org.zerock.seoulive.board.travel.mapper.BoardMapper;

import java.util.Objects;


@NoArgsConstructor
@Log4j2


@Service("TravelBoardLikeService")
public class TravelBoardLikeServiceImpl
        implements
        TravelBoardLikeService,
        InitializingBean,
        DisposableBean {


    @Setter(onMethod_ = {@Autowired})
    private BoardMapper dao;

    @Override
    public void boardLike(TravelBoardLikeDTO dto) throws ServiceException{
        try {

            this.dao.boardLike(dto);
        } catch (Exception e) {
            throw new ServiceException(e);
        }

    }

    @Override
    public void destroy() throws Exception {
        log.trace("\n\t destroy() invoked.");
    }

    @Override
    public void afterPropertiesSet() throws Exception {

        log.trace("\n\t afterPropertiesSet() invoked.");

//		assert this.dao != null;
        Objects.requireNonNull(this.dao);
        log.info("\n\t this.dao : {} ",dao);

    }
}
