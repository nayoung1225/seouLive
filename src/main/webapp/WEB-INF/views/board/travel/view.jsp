<%--
  Created by IntelliJ IDEA.
  User: sungjaehyun
  Date: 2023/05/10
  Time: 8:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서울, 지금 : SeouLive</title>
<%--    <link rel="icon" href="ico/SLlogo1.png">--%>

    <!-- header, footer 시작  -->
<%--    <link rel="stylesheet" href="css/reset.css">--%>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/4b84ea08f3.js" crossorigin="anonymous"></script>
    <!-- layout css -->
<%--    <link rel="stylesheet" href="css/layout/header.css">css--%>
<%--    <link rel="stylesheet" href="css/layout/footer.css">--%>
<%--    <!-- main css -->--%>
<%--    <link rel="stylesheet" href="css/main/main.css">--%>
<%--    <link rel="stylesheet" href="https://kit.fontawesome.com/4b84ea08f3.css" crossorigin="anonymous">--%>
    <!-- header, footer 끝  -->


    <!-- 여행지 view 시작 -->
    <link rel="stylesheet" href="../../../../resources/static/css/travel/view.css"/>
    <link rel="stylesheet" href="../../../../resources/static/css/layout/layout.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/e046991a5a.js" crossorigin="anonymous"></script>
    <!-- 여행지 view 끝 -->
    <jsp:include page="../../layout/header.jsp"/>
</head>
<body>



<!-- 여행지 view 시작  -->
<div id="wrap">
    <br>
    <div class="name">
        <h2>창경궁</h2>
    </div>
    <br>
    <div class="theme">
        <!-- <h2>테마</h2> -->
        <span>서울시 종로구</span>
    </div>
    <div class="etc">
        <a href="#"><i class="fa-regular fa-heart" style="color: #E76649"></i></a>
        <a href="#"><i class="fa-solid fa-share-nodes" style="color: #49539e;"></i></a>
    </div>

    <!-- <h3>사진</h3> -->
    <hr>

    <div class="swiper">

        <!-- Additional required wrapper -->
        <div class="swiper-wrapper">
            <!-- Slides -->
            <div class="swiper-slide"><img src="../../../../resources/static/img/IMG_1000.JPG" onclick="window.open(this.src)" style="height: 100%; width: 100%;" ></div>
            <div class="swiper-slide"><img src="../../../../resources/static/img/IMG_1001.JPG" onclick="window.open(this.src)" style="height: 100%; width: 100%;" ></div>
            <div class="swiper-slide"><img src="../../../../resources/static/img/IMG_1002.JPG" onclick="window.open(this.src)" style="height: 100%; width: 100%;" ></div>
        </div>
        <!-- If we need pagination -->
        <div class="swiper-pagination"></div>

        <!-- If we need navigation buttons -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>

    </div>

    <h3>상세설명</h3>
    <hr>
    <div class="exam">

        <ul>
            <li>시간</li>
            <li>날짜</li>
            <li>위치</li>
        </ul>

    </div>

    <h3>지도</h3>
    <hr>
    <div class="map">
        <img src="../../../../resources/static/img/IMG_1003.png" height="100%" width="100%">
    </div>

    <h3>추천 여행지</h3>
    <hr>
    <div class="recom">

        <div class="recom1">
            <img src="../../../../resources/static/img/IMG_1004.png" height="100%" width="100%">
            <div class="recom-name"><h3>추천 여행지 #1</h3></div>
        </div>

        <div class="recom2">
            <img src="../../../../resources/static/img/IMG_1005.png" height="100%" width="100%">
            <div class="recom-name"><h3>추천 여행지 #2</h3></div>
        </div>

        <div class="recom3">
            <img src="../../../../resources/static/img/IMG_1006.png" height="100%" width="100%">
            <div class="recom-name"><h3>추천 여행지 #3</h3></div>
        </div>


    </div>
    <br>

    <div class="list">
        <div><input type="button" value="수정"></div>
        <div><input type="button" value="삭제"></div>
        <div><input type="button" value="목록"><a href="/board/travel/list">목록</a></div>
    </div>
    <br>


</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

<script>
    const swiper = new Swiper(".swiper", {

        direction: "horizontal",
        loop: true,

        pagination: {
            el: ".swiper-pagination",
            type: "bullets",
            clickable: true,
        },

        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },

        spaceBetween: 10,
        slidesPreView: "auto",
        grabCursor: true,
        centerdSlides: true,
        speed: 600,
        effect: "coverflow",
        coverflowEffect: {
            rotate: 0,
            stretch: -100,
            depth: 50,
            modifier: 1,
            slideShadows: false,
        },

    });
    const btnStart = document.querySelector(".btnStart");
    const btnStop = document.querySelector(".btnStop");

    // btnStart.addEventListener("click", ()=> {
    //     swiper.autoplay.start();
    // });
    // btnStop.addEventListener("click", ()=> {
    //     swiper.autoplay.stop();
    // });
</script>
<!-- 여행지 view 끝  -->



</body>

</html>
