package org.zerock.seoulive.board.travel.domain;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;

@Component
@Data
public class Criteria {
    private Integer currPage = 1;   // 현재 페이지 번호
    private Integer amount = 10;    // 한 페이지당 게시물 개수
//    private Integer pageNum;

    private Integer pagesPerPage = 5; // 한 페이지당 보여줄 페이지목록의 길이

    // 스킵 할 게시물 수
    private Integer skip;

    // 검색에 필요한 키워드 선언
    private String searchType = "";
    private String keyword = "";         // 검색이름

//    private Date start_date;   // 캘린더 시작 날짜
//    private Date end_date;   // 캘린더 끝 날짜
    private String startDate;
    private String endDate;

    public Criteria() {
        this(1, 10);
        this.skip = 0;
    }

    public Criteria(int currPage, int amount) {
        this.currPage = currPage;
        this.amount = amount;
        this.skip = (currPage-1) * amount;
    }

    public String getKeyword(){
        return keyword;
    }

    public void setKeyword(String keyword){
        this.keyword = keyword;
    }

    public String toString(){
        return "Criteria [currPage= " + currPage + ", amount= " + amount + ", skip= " + skip + ", keyword=" + keyword + "]";
    }

    public Integer getAmount() {
        return amount != null ? amount : 10; // Null 값일 경우 기본값 10을 반환하도록 처리
    }

} // end class
