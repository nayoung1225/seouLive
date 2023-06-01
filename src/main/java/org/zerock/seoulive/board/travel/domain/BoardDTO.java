package org.zerock.seoulive.board.travel.domain;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

@Data

public class BoardDTO {

    private Integer seq;
    private String writer;
    private String category;
    private String title;
    private String content;
    private String address;
    private String total;

    private Date start_date;
    private Date end_date;
    private String end_time;


} // end class
