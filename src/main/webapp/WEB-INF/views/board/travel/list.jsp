<%--
  Created by IntelliJ IDEA.
  User: nayoung
  Date: 2023/05/10
  Time: 11:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>여행지 List</title>

    <link rel="stylesheet" href="../../../../resources/static/css/layout/layout.css">
    <link rel="stylesheet" href="../../../../resources/static/css/travel/list.css">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/static/css/tr  avel/list.css">--%>

    <script src="../../../../resources/static/js/travel/list.js" defer></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>

    <script src="https://kit.fontawesome.com/7ae3a6a91c.js" crossorigin="anonymous"></script>

    <script>

        $(function (){

            $('.pageNum').on('click', function(e){
                console.log('pageNum Clicked....')
                let selectedPageNum = e.currentTarget.textContent
                console.log(selectedPageNum);
                let url = "/board/travel/list?currPage=" + selectedPageNum;


                // category 파라미터를 추가
                <%--url += "&category=" + encodeURIComponent('${pageMaker.cri.category}');--%>
                <%--console.log(url);--%>


                <%--let searchType = "${pageMaker.cri.searchType.}";--%>
                <%--let keyword = "${pageMaker.cri.keyword}";--%>

                <%--location.href = "/board/travel/list?currPage=" + selectedPageNum + "&searchType=" + searchType + "&keyword=" + keyword;--%>

                let category = "${pageMaker.cri.category}";
                let searchType = "${pageMaker.cri.searchType}";
                let keyword = "${pageMaker.cri.keyword}";

                location.href = "/board/travel/list?currPage=" + selectedPageNum +
                    "&category=" + encodeURIComponent(category) +
                    "&searchType=" + encodeURIComponent(searchType) +
                    "&keyword=" + encodeURIComponent(keyword);

            }); // onclick

        }) // .jq

    </script>

</head>

<body>
<!-- <%-- header --%> -->
<jsp:include page="../../layout/header.jsp"/>

<div id="container" class="list_wrap">

    <form id="moveForm" action="/board/travel/list" method="get">

        <!-- search bar -->
        <div class="search_wrap">
            <div class="search">
                <select name="category" id="category" onchange="changeFn()">
                    <option value="">전체</option>
                    <option value="공연">공연</option>
                    <option value="야외활동">야외활동</option>
                    <option value="팝업스토어">팝업스토어</option>
                    <option value="전시회">전시회</option>
                </select>
                <input type="text" class="searchTerm" placeholder="검색내용을 입력하세요." name="keyword" >
                <button type="submit" class="searchButton">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </div>

        <input type="hidden" name="currPage" value="${pageMaker.cri.currPage}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
<%--        <input type="radio" name="category" value="${pageMaker.cri.category}">--%>
<%--        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">--%>
        
    </form>


    <!-- tab menu -->
<%--<c:forEach var="boardVO" items="${__LIST__}">--%>

    <form id="categoryForm" action="/board/travel/list" method="get">

        <input type="hidden" name="currPage" value="1">
        <div class="category tab" name="category" >

<%--            <div class="category">--%>
<%--                <span><strong>카테고리</strong></span>--%>
<%--            </div>--%>
            <div>
                <label data-tab="menu1">
                    <input type="radio" name="category" value="" checked>
                    전체
                </label>
                <label data-tab="menu2">
                    <input type="radio" name="category" value="공연">
                    공연
                </label>
                <label data-tab="menu3">
                    <input type="radio" name="category" value="야외활동">
                    야외활동
                </label>
                <label data-tab="menu4">
                    <input type="radio" name="category" value="팝업스토어">
                    팝업스토어
                </label>
                <label data-tab="menu5">
                    <input type="radio" name="category" value="전시회">
                    전시회
                </label>
            </div>
        </div>
    </form>

<%--</c:forEach>--%>

<%--    <form id="categoryForm" action="/board/travel/list" method="get">--%>
<%--        <ul class="tab">--%>
<%--            <li class="on" data-tab="menu1" data-value=""><a href="#">전체</a></li>--%>
<%--            <li data-tab="menu2" data-value="공연"><a href="#">공연</a></li>--%>
<%--            <li data-tab="menu3" data-value="야외활동"><a href="#">야외활동</a></li>--%>
<%--            <li data-tab="menu4" data-value="팝업스토어"><a href="#">팝업스토어</a></li>--%>
<%--            <li data-tab="menu5" data-value="전시회"><a href="#">전시회</a></li>--%>
<%--        </ul>--%>
<%--    </form>--%>


    <div id="menu1" class="tabcont on">
        <!-- calendar -->
        <div class="calendarWrap">
            <div class="contBox">
                <div class="item" id="today">
                    <div id="week"></div>
                    <div id="date"></div>
                </div>
                <div class="item item_cal">
                    <button type="button" onclick="prev()"> < </button>
                    <div id="year" class="top-bar"></div>
                    <div id="month" class="top-bar"></div>
                    <button type="button" onclick="next()"> > </button><br>
                    <table>
                        <tr>
                            <th>일</th>
                            <th>월</th>
                            <th>화</th>
                            <th>수</th>
                            <th>목</th>
                            <th>금</th>
                            <th>토</th>
                        </tr>
                        <tr>
                            <td data-date="2023-05-20">20</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <!-- calendar end -->

        <h3>카테고리 > 전체</h3>

        <ul class="list_thumType flnon">
<%--            <li>START</li>--%>

            <%
                System.out.println("**************** LIST ************");
                System.out.println( request.getAttribute("__LIST__") );
            %>

            <c:forEach var="boardVO" items="${__LIST__}">
                <li class="thum thum_1">
                    <div class="photo">
                        <a href="#"><img src="https://picsum.photos/id/122/200/300" alt="이미지"></a>
                        <em class="flag type_ing">진행중</em>
                    </div>
                    <div class="area_txt">
                        <i class="fas fa-heart off">
                            <input type="hidden" name="board" value="travel" >
                            <input type="hidden" name="board_seq" value="${boardVO.seq}" >
                        </i>
<%--                        <div class="seq"><a href="/board/travel/view?seq=${boardVO.seq}">${boardVO.seq}</a></div>--%>
                        <div class="category">
                            <a href="/board/travel/view?category=${boardVO.category}">[${boardVO.category}]</a>
                        </div>
                        <div class="tit"><a href="/board/travel/view?seq=${boardVO.seq}">${boardVO.title}</a></div>
                        <div class="start_date">
                            <a href="/board/travel/view?start_date=${boardVO.start_date}">${boardVO.start_date}</a>
                            <a href="/board/travel/view?end_date=${boardVO.end_date}">${boardVO.end_date}</a>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>

        <!-- pagination -->
        <div class="pagination_wrap">
            <ul class="pagination">
                <c:if test="${pageMaker.prev}">
                    <li class="Prev">
                        <a href="/board/travel/list?currPage=${pageMaker.startPage - 1}">이전</a>
                    </li>
                </c:if>

                <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="pageNum ${ pageMaker.cri.currPage == pageNum? 'current':'' }">${pageNum}</li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="Next">
                        <a href="/board/travel/list?currPage=${pageMaker.endPage + 1}">다음</a>
                    </li>
                </c:if>
            </ul>
            <div class="btn_wrap">
                <button class="write_btn"><a href="${pageContext.request.contextPath}/board/travel/write">글쓰기</a></button>
            </div>
        </div>

    </div>

    <%--  공연 카테고리  --%>
    <div id="menu2" class="tabcont item" data-category="공연">

        <h3>카테고리 > 공연</h3>
        <ul class="list_thumType flnon">

                <c:forEach var="boardVO" items="${__LIST__}">
                    <li class="thum thum_1">
                        <div class="photo">
                            <a href="#"><img src="https://picsum.photos/id/122/200/300" alt="이미지"></a>
                            <em class="flag type_ing">진행중</em>
                        </div>
                        <div class="area_txt">
                            <i class="fas fa-heart off"></i>
                                <%--                        <div class="seq"><a href="/board/travel/view?seq=${boardVO.seq}">${boardVO.seq}</a></div>--%>
                            <div class="category">
                                <a href="/board/travel/view?category=${boardVO.category}">[${boardVO.category}]</a>
                            </div>
                            <div class="tit"><a href="/board/travel/view?seq=${boardVO.seq}">${boardVO.title}</a></div>
                            <div class="start_date">
                                <a href="/board/travel/view?start_date=${boardVO.start_date}">${boardVO.start_date}</a>
                            </div>
                            <div class="end_date">
                                <a href="/board/travel/view?end_date=${boardVO.end_date}">${boardVO.end_date}</a>
                            </div>
                                <%--                        <div class="tit"><a href="/board/travel/view?start_date=${boardVO.start_date}">${boardVO.start_date}</a></div>--%>
                                <%--                        <p class="date">[2023. 4. 5.~2023. 4. 9.]</p>--%>
                                <%--                        <p class="tag"><span>#가볼만한축제</span><span>#가족과함께</span><span>#가족여행</span><span>#관광지</span><span>#기차여행</span><span>#꽃여행</span></p>--%>
                        </div>
                    </li>
                </c:forEach>
        </ul>



        <!-- pagination -->
        <div class="pagination_wrap">
            <ul class="pagination">
                <c:if test="${pageMaker.prev}">
                    <li class="Prev">
                        <a href="/board/travel/list?currPage=${pageMaker.startPage - 1}">이전</a>
                    </li>
                </c:if>

                <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="pageNum ${ pageMaker.cri.currPage == pageNum? 'current':'' }">${pageNum}</li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="Next">
                        <a href="/board/travel/list?currPage=${pageMaker.endPage + 1}">다음</a>
                    </li>
                </c:if>
            </ul>
            <div class="btn_wrap">
                <button class="write_btn"><a href="${pageContext.request.contextPath}/board/travel/write">글쓰기</a></button>
            </div>
        </div>
    </div>

    <%--  야외활동 카테고리  --%>
    <div id="menu3" class="tabcont item" data-category="야외활동">

        <h3>카테고리 > 야외활동</h3>

        <ul class="list_thumType flnon">
            <c:forEach var="boardVO" items="${__LIST__}">
                <li class="thum thum_1">
                    <div class="photo">
                        <a href="#"><img src="https://picsum.photos/id/122/200/300" alt="이미지"></a>
                        <em class="flag type_ing">진행중</em>
                    </div>
                    <div class="area_txt">
                        <i class="fas fa-heart off"></i>
<%--                        <div class="seq"><a href="/board/travel/view?seq=${boardVO.seq}">${boardVO.seq}</a></div>--%>
                        <div class="category"><a href="/board/travel/view?category=${boardVO.category}">[${boardVO.category}]</a></div>
                        <div class="tit"><a href="/board/travel/view?seq=${boardVO.seq}">${boardVO.title}</a></div>
                        <div class="start_date">
                            <a href="/board/travel/view?start_date=${boardVO.start_date}">${boardVO.start_date}</a>
                        </div>
                        <div class="end_date">
                            <a href="/board/travel/view?end_date=${boardVO.end_date}">${boardVO.end_date}</a>
                        </div>
<%--                        <p class="date">[2023. 4. 5.~2023. 4. 9.]</p>--%>
<%--                        <p class="tag"><span>#가볼만한축제</span><span>#가족과함께</span><span>#가족여행</span><span>#관광지</span><span>#기차여행</span><span>#꽃여행</span></p>--%>
                    </div>
                </li>
            </c:forEach>
        </ul>

        <!-- pagination -->
        <div class="pagination_wrap">
            <ul class="pagination">
                <c:if test="${pageMaker.prev}">
                    <li class="Prev">
                        <a href="/board/travel/list?currPage=${pageMaker.startPage - 1}">이전</a>
                    </li>
                </c:if>

                <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="pageNum ${ pageMaker.cri.currPage == pageNum? 'current':'' }">${pageNum}</li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="Next">
                        <a href="/board/travel/list?currPage=${pageMaker.endPage + 1}">다음</a>
                    </li>
                </c:if>
            </ul>
            <div class="btn_wrap">
                <button class="write_btn"><a href="${pageContext.request.contextPath}/board/travel/write">글쓰기</a></button>
            </div>
        </div>

    </div>

    <%-- 팝업스토어 카테고리 --%>
    <div id="menu4" class="tabcont item" data-category="팝업스토어">

        <h3>카테고리 > 팝업스토어</h3>

        <ul class="list_thumType flnon">
            <c:forEach var="boardVO" items="${__LIST__}">
                <li class="thum thum_1">
                    <div class="photo">
                        <a href="#"><img src="https://picsum.photos/id/122/200/300" alt="이미지"></a>
                        <em class="flag type_ing">진행중</em>
                    </div>
                    <div class="area_txt">
                        <i class="fas fa-heart off"></i>
<%--                        <div class="seq"><a href="/board/travel/view?seq=${boardVO.seq}">${boardVO.seq}</a></div>--%>
                        <div class="category"><a href="/board/travel/view?category=${boardVO.category}">[${boardVO.category}]</a></div>
                        <div class="tit"><a href="/board/travel/view?seq=${boardVO.seq}">${boardVO.title}</a></div>
                        <div class="start_date">
                            <a href="/board/travel/view?start_date=${boardVO.start_date}">${boardVO.start_date}</a>
                        </div>
                        <div class="end_date">
                            <a href="/board/travel/view?end_date=${boardVO.end_date}">${boardVO.end_date}</a>
                        </div>
<%--                        <p class="date">[2023. 4. 5.~2023. 4. 9.]</p>--%>
<%--                        <p class="tag"><span>#가볼만한축제</span><span>#가족과함께</span><span>#가족여행</span><span>#관광지</span><span>#기차여행</span><span>#꽃여행</span></p>--%>
                    </div>
                </li>
            </c:forEach>
        </ul>

        <!-- pagination -->
        <div class="pagination_wrap">
            <ul class="pagination">
                <c:if test="${pageMaker.prev}">
                    <li class="Prev">
                        <a href="/board/travel/list?currPage=${pageMaker.startPage - 1}">이전</a>
                    </li>
                </c:if>

                <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="pageNum ${ pageMaker.cri.currPage == pageNum? 'current':'' }">${pageNum}</li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="Next">
                        <a href="/board/travel/list?currPage=${pageMaker.endPage + 1}">다음</a>
                    </li>
                </c:if>
            </ul>
            <div class="btn_wrap">
                <button class="write_btn"><a href="${pageContext.request.contextPath}/board/travel/write">글쓰기</a></button>
            </div>
        </div>
    </div>

    <%-- 전시회 카테고리 --%>
    <div id="menu5" class="tabcont item" data-category="전시회">

        <h3>카테고리 > 전시회</h3>

        <ul class="list_thumType flnon">
            <c:forEach var="boardVO" items="${__LIST__}">
                <li class="thum thum_1">
                    <div class="photo">
                        <a href="#"><img src="https://picsum.photos/id/122/200/300" alt="이미지"></a>
                        <em class="flag type_ing">진행중</em>
                    </div>
                    <div class="area_txt">
                        <i class="fas fa-heart off"></i>
<%--                        <div class="seq"><a href="/board/travel/view?seq=${boardVO.seq}">${boardVO.seq}</a></div>--%>
                        <div class="category"><a href="/board/travel/view?category=${boardVO.category}">[${boardVO.category}]</a></div>
                        <div class="tit"><a href="/board/travel/view?seq=${boardVO.seq}">${boardVO.title}</a></div>
                        <div class="start_date">
                            <a href="/board/travel/view?start_date=${boardVO.start_date}">${boardVO.start_date}</a>
                        </div>
                        <div class="end_date">
                            <a href="/board/travel/view?end_date=${boardVO.end_date}">${boardVO.end_date}</a>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>

        <!-- pagination -->
        <div class="pagination_wrap">
            <ul class="pagination">
                <c:if test="${pageMaker.prev}">
                    <li class="Prev">
                        <a href="/board/travel/list?currPage=${pageMaker.startPage - 1}">이전</a>
                    </li>
                </c:if>

                <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="pageNum ${ pageMaker.cri.currPage == pageNum? 'current':'' }">${pageNum}</li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="Next">
                        <a href="/board/travel/list?currPage=${pageMaker.endPage + 1}">다음</a>
                    </li>
                </c:if>
            </ul>
            <div class="btn_wrap">
                <button class="write_btn"><a href="${pageContext.request.contextPath}/board/travel/write">글쓰기</a></button>
            </div>
        </div>
    </div>


</div>
    

</body>

<jsp:include page="../../layout/footer.jsp"/>
</html>
