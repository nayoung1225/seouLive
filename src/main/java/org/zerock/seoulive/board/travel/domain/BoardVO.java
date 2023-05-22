package org.zerock.seoulive.board.travel.domain;

import lombok.Value;
import lombok.extern.log4j.Log4j2;
import oracle.sql.TIMESTAMP;

import java.sql.Timestamp;

@Value
@Log4j2

public class BoardVO {
    private Integer seq;
    private String writer;
    private String category;
    private String title;
    private String content;
    private String address;
    private String total;
    private Timestamp write_date;
    private Timestamp modify_date;

    private Timestamp start_date;
    private Timestamp end_date;
    public BoardDTO toDTO(){
        log.trace("toDTO() invoked.");

        BoardDTO dto = new BoardDTO();
        dto.setSeq(seq);
        dto.setWriter(writer);
        dto.setCategory(category);
        dto.setTitle(title);
        dto.setContent(content);
        dto.setAddress(address);
        dto.setTotal(total);
        dto.setWrite_date(write_date);
        dto.setModify_date(modify_date);
        dto.setStart_date(start_date);
        dto.setEnd_date(end_date);



        log.info("/t+ dto:{}", dto);

        return dto;

    } // TravelDTO

} // end class 
