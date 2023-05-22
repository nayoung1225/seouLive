package org.zerock.seoulive.board.travel.domain;

import lombok.Data;

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
    private Timestamp write_date;
    private Timestamp modify_date;

    private Timestamp start_date;
    private Timestamp end_date;


} // end class
