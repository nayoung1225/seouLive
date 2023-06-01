package org.zerock.seoulive.board.travel.service;

import org.apache.ibatis.annotations.Insert;
import org.zerock.seoulive.board.travel.domain.TravelBoardLikeDTO;
import org.zerock.seoulive.board.travel.exception.ServiceException;

public interface TravelBoardLikeService {
    public abstract void boardLike(TravelBoardLikeDTO dto) throws ServiceException;

}
