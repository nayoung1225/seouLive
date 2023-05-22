package org.zerock.seoulive.board.travel.mapper;

import oracle.sql.NUMBER;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.zerock.seoulive.board.travel.domain.BoardDTO;
import org.zerock.seoulive.board.travel.domain.BoardVO;
import org.zerock.seoulive.board.travel.domain.Criteria;

import java.util.List;


@Mapper

public interface BoardMapper {

//    @Select("""
//			    SELECT *
//			    FROM tbl_travel
//			    WHERE title LIKE '%' || #{keyword} || '%'
//			    AND category LIKE '%' || #{searchType} || '%'
//    			AND date LIKE '%' || #{currDate} || '%'
//				OFFSET ( #{currPage} - 1 ) * #{amount} ROWS
//				FETCH NEXT #{amount} ROWS ONLY
//			""")

	@Select("""
				  SELECT *
				  FROM tbl_travel
				  WHERE title LIKE '%' || #{keyword} || '%'
				  AND category LIKE '%' || #{searchType} || '%'
				  OFFSET (#{currPage} - 1) * #{amount} ROWS
				  FETCH NEXT #{amount} ROWS ONLY
			""")




//	@Select("""
//         SELECT /*+ index_desc(TBL_TRAVEL) */ *
//         FROM TBL_TRAVEL
//         """)
	public abstract List<BoardVO> selectList(Criteria cri);


	// 2. 새로운 게시물 등록
	public abstract Integer insert(BoardDTO dto);

	// 3. 특정 게시물 상세조회
	public abstract BoardVO select(NUMBER seq);

	// 4. 특정 게시물 삭제
	public abstract Integer delete(NUMBER seq);

	// 5. 특정 게시물 업데이트(갱신)
	public abstract Integer update(BoardDTO dto);


	// 6. 요청싯점에 총 게시물(레코드) 개수를 반환
	@Select("SELECT count(seq) FROM tbl_travel WHERE seq > 0")
	public abstract Integer getTotalAmount();

	public abstract Integer getTotal(Criteria cri);

	List<BoardVO> selectListByDate(String selectedDate);
} // end class
