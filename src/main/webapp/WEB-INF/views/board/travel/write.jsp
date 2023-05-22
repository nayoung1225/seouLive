


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행지 write</title>


    <link rel="stylesheet" href="../../../../resources/static/css/layout/layout.css">
    <link rel="stylesheet" href="../../../../resources/static/css/travel/write.css">

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

</head>
<body>
    <form action="#" method="post">
        <!-- 제목 -->
        <div class="travel_title">
            <input type="text" placeholder="제목을 입력해 주세요.">
        </div>
        
        <!-- 카테고리 -->
        <div class="travel_thema">
            <label for="travelplace"><input type="checkbox" id="travelplace" value="travel" name="thema"><span>#여행지</span></label>
            <label for="exhibition"><input type="checkbox" id="exhibition" value="exhibition" name="thema"><span>#전시회</span></label>
            <label for="popup"><input type="checkbox" id="popup" value="popup" name="thema"><span>#팝업스토어</span></label>
        </div>

        <!-- 캘린더 내용 -->
        <div class="cal_input">
            <div class="cal_date_input">
                <label for="date_from">시작일자 </label><input type="date" name="cal_date" id="start_date">
                <label for="date_to"> 종료일자 </label><input type="date" name="cal_date" id="end_date"><br>
            </div>
            <div class="cal_time_input">
                <label for="start_time">시작시간 </label><input type="time" name="cal_time" id="start_time">
                <label for="end_time"> 종료시간 </label><input type="time" name="cal_time" id="end_time">
                <input type="checkbox" name="cal_date" id="all_day"><label for="all_day"> 하루종일</label>
            </div>
        </div>

        <!-- 본문 -->
        <div class="content">
            <input type="text" id="contents" name="contents" placeholder="내용을 입력하세요.">
        </div>

        <div class="location">
            <label>위치 </label><input type="text" placeholder="주소 노출">
        </div>

        <!-- 첨부파일 -->
        <div id="preview_imgs"></div>
        <div class="travel_filebox">
            <label for="select_image">사진 선택</label>
            <input type="file" id="select_image" accept="image/*" onchange="imageChange(event);" multiple="multiple">
        </div>

        <!-- 버튼 -->
        <div class="travel_button">
            <input type="reset" value="취소">
            <input type="submit" value="작성">
        </div>
    </form>


    <script>
        // 이미지 미리보기
        function imageChange(event){
            let i = event.target.files.length-1;
            for(let image of event.target.files){
                let img = document.createElement("img");
                const reader = new FileReader();
                reader.onload = function(event){
                    img.setAttribute("src", event.target.result);
                }
                reader.readAsDataURL(event.target.files[i--]);  
                document.querySelector("#preview_imgs").appendChild(img);
            }
        }

        // 하루종일 체크 시 시간 변경


    </script>

</body>
</html>