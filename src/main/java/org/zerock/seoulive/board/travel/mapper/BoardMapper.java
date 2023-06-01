package org.zerock.seoulive.board.travel.mapper;

import oracle.sql.NUMBER;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.zerock.seoulive.board.travel.domain.BoardDTO;
import org.zerock.seoulive.board.travel.domain.BoardVO;
import org.zerock.seoulive.board.travel.domain.Criteria;
import org.zerock.seoulive.board.travel.domain.TravelBoardLikeDTO;

import java.util.List;


@Mapper

public interface BoardMapper {

	@Select("""
				  SELECT *
				  FROM tbl_travel
				  WHERE title LIKE '%' || #{keyword} || '%'
				  AND category LIKE '%' || #{searchType} || '%'
				  OFFSET (#{currPage} - 1) * #{amount} ROWS
				  FETCH NEXT #{amount} ROWS ONLY
			""")
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
	@Select("""
   			SELECT count(seq) FROM tbl_travel
			WHERE seq LIKE '%' || #{keyword} || '%'
			AND category LIKE '%' || #{searchType} || '%'
			""")
	public abstract Integer getTotalAmount(Criteria cri);


	public abstract Integer getTotal(Criteria cri);

	List<BoardVO> selectListByDate(String selectedDate);

	// 8. 게시물 찜
	@Insert("""
			INSERT INTO tbl_like (EMAIL, BOARD_SEQ, BOARD)
			VALUES ('nykim@naver.com', #{board_seq}, #{board})
			""")
	public abstract void boardLike(TravelBoardLikeDTO dto);

	// 9. 카테고리 검색
	@Select("""
			SELECT count(seq) FROM tbl_travel
			WHERE category LIKE '%' || #{searchType} || '%'
			""")
	public abstract void categorySelect(BoardDTO dto);



	// 9. 달력
//	@Select("""
//   			SELECT *
//   			FROM tbl_travel
//			WHERE start_date LIKE '%' || #{keyword} || '%'
//		""")
//	public abstract List<BoardVO> selectList(Criteria cri);

} // end class
