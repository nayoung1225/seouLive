// tabmenu
$(function() {
    $('ul.tab li').click(function() {
        var activeTab = $(this).attr('data-tab');
        $('ul.tab li').removeClass('on');
        $('.tabcont').removeClass('on');
        $(this).addClass('on');
        $('#' + activeTab).addClass('on');
    })
});

// 좋아요 버튼 활성화
var $heartIcon = $('.tabcont .list_thumType li.thum div.area_txt .fa-heart');
$heartIcon.click(function() {
    $(this).toggleClass('on');
    alert("좋아요!");
})

// changeFn() : select option 값을 가져와 tab 활성화
function changeFn() {
    var selectedValue = $("#category").val();

    // 모든 탭과 탭 컨텐츠 비활성화
    $(".tab li").removeClass("on");
    $(".tabcont").removeClass("on");

    // 선택된 값에 해당하는 탭과 탭 컨텐츠 활성화
    if (selectedValue === "공연") {
        $(".tab [data-tab='menu2']").addClass("on");
        $("#menu2").addClass("on");
    } else if (selectedValue === "야외활동") {
        $(".tab [data-tab='menu3']").addClass("on");
        $("#menu3").addClass("on");
    } else if (selectedValue === "팝업스토어") {
        $(".tab [data-tab='menu4']").addClass("on");
        $("#menu4").addClass("on");
    } else if (selectedValue === "전시회") {
        $(".tab [data-tab='menu5']").addClass("on");
        $("#menu5").addClass("on");
    } else {
        // 선택된 값에 해당하는 탭이 없는 경우 전체 탭 활성화
        $(".tab li:first-child").addClass("on");
        $("#menu1").addClass("on");
    }
} // changeFn()




// calendar
const days = ["일", "월", "화", "수", "목", "금", "토"];
const months = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
let newDate = new Date();
let year = newDate.getFullYear();
let month = newDate.getMonth();
let day = newDate.getDay();
let week = days[day];
let date = newDate.getDate();
let selectYear = document.querySelector("#year")
let selectMonth = document.querySelector("#month")
let selectWeek = document.querySelector("#week")
let selectDate = document.querySelector("#date")
let table = document.querySelector("table");
let td = document.querySelector("td");
let dateNum = 0;
let firstDay = 0;
let lastDate = 0;
let lastDay = 0;
let clickDay = 0;
let today = 0;
let preTarget = 0;
let preTargetText = 0;

function clickDate(){
    if(event.target.nodeName == "TD" && event.target.textContent !== ""){
        if(preTarget !== 0 && (preTargetText != date || month != newDate.getMonth())){
            preTarget.className = "";
        }
        if(event.target.textContent != date || newDate.getMonth() != month){
            event.target.className = "click-circle";
        }
        selectDate.textContent = event.target.textContent + "일";
        clickDay = firstDay + event.target.textContent % 7 - 1;

        if(clickDay < 0){
            clickDay = clickDay + 7;
        }
        else if(clickDay > 6){
            clickDay = clickDay - 7;
        }
        selectWeek.textContent = days[clickDay] + "요일";
        preTarget = event.target;
        preTargetText = event.target.textContent;
    }
} // clickDate

function dateMaker(){
    if(firstDay < 0){
        firstDay = firstDay + 7;
    }
    else if(firstDay > 6){
        firstDay = firstDay - 7;
    }
    for(let i = 0; i < firstDay; i++){
        table.rows[1].cells[i].textContent = null;
    }
    for(let i = firstDay; i <= 6; i++){
        dateNum++;
        table.rows[1].cells[i].textContent = dateNum;
    }
    for(let i = 2; i <= 4; i++){
        for(let j = 0; j <= 6; j++){
            dateNum++;
            table.rows[i].cells[j].textContent = dateNum;
        }
    }
    lastDay = firstDay + (lastDate - 29);

    if(lastDay > 6){
        lastDay = lastDay - 7;

        for(let i = 0; i <= 6; i++){
            dateNum++;
            table.rows[5].cells[i].textContent = dateNum;
        }
        for(let i = 0; i <= lastDay; i++){
            dateNum++;
            table.rows[6].cells[i].textContent = dateNum;
        }
        for(let i = lastDay + 1; i <= 6; i++){
            table.rows[6].cells[i].textContent = null;
        }
    } else{
        for(let i = 0; i <= lastDay; i++){
            dateNum++;
            table.rows[5].cells[i].textContent = dateNum;
        }
        for(let i = lastDay + 1; i <= 6; i++){
            dateNum++;
            table.rows[5].cells[i].textContent = null;
        }
        for(let i = 0; i <= 6; i++){
            table.rows[6].cells[i].textContent = null;
        }
    }
    if(month === newDate.getMonth() && year === newDate.getFullYear()){
        today = table.rows[Math.ceil((date + firstDay) / 7)].cells[day];
        today.className = "today-circle";
    } else{
        today.className = "";
    }
    preTarget.className = "";
} // dateMaker

function lastDateCheck(){
    if(month === 3||month === 5||month === 8||month === 10){
        lastDate = 30;
    }
    else if(month === 1){
        if(year % 4 === 0){
            lastDate = 29;
        }
        else{
            lastDate = 28;
        }
    }
    else{
        lastDate = 31;
    }
} // lastDateCheck

function firstDayDisplay(){
    if(month !== newDate.getMonth() || year !== newDate.getFullYear()){
        selectWeek.textContent = days[firstDay] + "요일";
        selectDate.textContent = 1 + "일";
    }
    else{
        selectWeek.textContent = week + "요일";
        selectDate.textContent = date + "일";
    }
} // firstDayDisplay

function prev(){
    if(month === 0){
        month = 11;
        year--;
    }
    else{
        month--;
    }
    selectMonth.textContent = months[month];
    selectYear.textContent = year + "년";

    lastDateCheck()
    dateNum = 0;
    lastDay = firstDay - 1;
    firstDay = firstDay - (lastDate - 28);

    dateMaker();
    firstDayDisplay();
} // prev
function next(){
    if(month === 11){
        month = 0;
        year++;
    }
    else{
        month++;
    }
    selectMonth.textContent = months[month];
    selectYear.textContent = year + "년";

    lastDateCheck()
    dateNum = 0;
    firstDay = lastDay + 1;

    dateMaker();
    firstDayDisplay();
} // next
selectYear.textContent = year + "년";
selectMonth.textContent = months[month];
selectWeek.textContent = week + "요일";
selectDate.textContent = date + "일";
firstDay = newDate.getDay() - date % 7 + 1;

lastDateCheck()
dateMaker();

table.onclick = clickDate;


