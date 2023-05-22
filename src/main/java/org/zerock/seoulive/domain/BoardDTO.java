package org.zerock.seoulive.domain;

import lombok.Data;

@Data // DTO를 만들어주는 롬복의 어노테이션 @Data
public class BoardDTO {

        private Integer bno;
        private String title;
        private String content;
        private String writer;
//	private Timestamp insertTs;
//	private Timestamp updateTs;

} // end class

