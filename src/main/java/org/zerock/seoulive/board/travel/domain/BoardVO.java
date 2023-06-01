package org.zerock.seoulive.board.travel.domain;

import lombok.Value;
import lombok.extern.log4j.Log4j2;
import oracle.sql.TIMESTAMP;

import java.sql.Date;
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

    private Date start_date;
    private Date end_date;
    private String start_time;
    private String end_time;

//    private Timestamp write_date;
//    private Timestamp modify_date;

//    private Timestamp startDate;
//    private Timestamp end_date;
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
        dto.setStart_date(start_date);
        dto.setEnd_date(end_date);
        dto.setEnd_time(end_time);

        log.info("/t+ dto:{}", dto);

        return dto;

    } // TravelDTO

    public String getTitle() {
        return title;
    }

} // end class 
