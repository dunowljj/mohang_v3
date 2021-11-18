<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- slick -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="../resources/css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../resources/css/slick.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/slick-theme.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/slick.js"></script>
<!-- 달력 -->


<script>
   var now = new Date(); // 현재 날짜 및 시간
   var year = now.getFullYear(); // 연도
   var month = now.getMonth() + 1; // 월
   var lastDate = new Date(year, month, 0).getDate();
   $(function() {
      if(document.getElementById('month')){
      document.getElementById("month").innerHTML = '<em>' + year + '년</em>' + '<em>' + month + '월</em>';
            
      document.getElementById("day").innerHTML = html;
      var html = '<ul>';
      for (var i = 1; i <= lastDate; i++) {
         html += '<li><a href="#" class="on">' + i + '</a></li>';
      }
      html += '</ul>';
      document.getElementById("day").innerHTML = html;
      html = '';
      $('input[name=year]').val(year);
      $('input[name=month]').val(month);
      $('#year_prev')
            .click(
                  function() {
                     if (month == 1) {
                        month = 13;
                        year = year - 1;
                     }
                     month = month - 1;
                     document.getElementById("month").innerHTML = '<em>'
                           + year + '년</em>' + '<em>' + month
                           + '월</em>';
                     lastDate = new Date(year, month, 0).getDate();
                     document.getElementById("day").innerHTML = html;
                     var html = '<ul>';
                     for (var i = 1; i <= lastDate; i++) {
                        html += '<li><a href="#" class="on">' + i
                              + '</a></li>';
                     }
                     html += '</ul>';
                     document.getElementById("day").innerHTML = html;
                     html = '';
                     $('input[name=year]').val(year);
                     $('input[name=month]').val(month);
                  })
      $('#year_next').click(
                  function() {
                     if (month == 12) {
                        month = 0;
                        year = year + 1;
                     }
                     month = month + 1;
                     document.getElementById("month").innerHTML = '<em>'
                           + year + '년</em>' + '<em>' + month
                           + '월</em>';
                     lastDate = new Date(year, month, 0).getDate();
                     document.getElementById("day").innerHTML = html;
                     var html = '<ul>';
                     for (var i = 1; i <= lastDate; i++) {
                        html += '<li><a href="#" class="on">' + i
                              + '</a></li>';
                     }
                     html += '</ul>';
                     document.getElementById("day").innerHTML = html;
                     html = '';
                     $('input[name=year]').val(year);
                     $('input[name=month]').val(month);
                  })
   
      }
   })
</script>

<script>
   $(
         function() {
            $('.slider-div')
                  .slick(
                        {
                           slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
                           infinite : true, //무한 반복 옵션    
                           slidesToShow : 4, // 한 화면에 보여질 컨텐츠 개수
                           slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
                           speed : 100, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
                           arrows : true, // 옆으로 이동하는 화살표 표시 여부
                           dots : true, // 스크롤바 아래 점으로 페이지네이션 여부
                           autoplay : false, // 자동 스크롤 사용 여부
                           autoplaySpeed : 10000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
                           pauseOnHover : true, // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
                           vertical : false, // 세로 방향 슬라이드 옵션

                           prevArrow : "<button type='button' class='slick-prev'>Previous</button>", // 이전 화살표 모양 설정
                           nextArrow : "<button type='button' class='slick-next'>Next</button>", // 다음 화살표 모양 설정

                           draggable : true, //드래그 가능 여부 

                           responsive : [ // 반응형 웹 구현 옵션
                           {
                              breakpoint : 960, //화면 사이즈 960px
                              settings : {
                                 //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                                 slidesToShow : 3
                              }
                           }, {
                              breakpoint : 768, //화면 사이즈 768px
                              settings : {
                                 //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                                 slidesToShow : 2
                              }
                           } ]

                        });
         })
</script>
<!-- slick end -->
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
   crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
   rel="stylesheet" type="text/css" />
<link
   href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
   rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body id="page-top">
   <!-- Navigation-->
   <nav
      class="navbar navbar-expand-lg text-uppercase fixed-top bg-secondary"
      id="mainNav">
      <div class="container">
         <a class="navbar-brand" href="/MoHang/Main/MoHang.do"><img
            src="../resources/images/logo.png"
            style="width: 140px; height: 80p; background: black;"></a>
         <form method="post" action="/MoHang/search/eventsearch.do" class="event-search" >
            <i class="fas fa-search" id="search_img"></i>
             <input   class="eventus-input" id="einput" type="search" name="keyword">
         </form>
         <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="nav-eventbar">
               <li><a href="/MoHang/organization/applyForm.do">단체정보신청</a></li>
               <li><a href="/MoHang/event/applyList.do">신청 리스트확인</a></li>
            </ul>
            <ul class="nav-loginbar">
               <li><a href="/MoHang/Login/login.do">로그인</a></li>
               <li><a href="/MoHang/Login/join.do">회원가입</a></li>
            </ul>
            <div id="pro_box">
               <a href="#"><img src="../resources/images/프로필.png"></a>
               <div class="button">
                  <img src="../resources/images/button.png">
               </div>
               <div id="myPage1" style="display: none">
                  <ul>
                     <li>xxx님</li>
                     <li><a href="/MoHang/general/likeList.do">관심있는 행사</a></li>
                     <li><a href="/MoHang/organization/applyForm.do">단체 정보 신청</a></li>
                     <li><a href="/MoHang/event/insertForm.do">행사 신청</a></li>
                     <li><a href="/MoHang/event/applyList.do">my 행사 리스트</a></li>
                     <li><a href="/MoHang/event/statisticsList.do">결과 분석 그래프</a></li>
                     <li><a href="#">1:1 채팅</a></li>
                     <li><a href="/MoHang/general/reserveList.do">예약확인</a></li>
                     <li><a href="/MoHang/general/reviewList.do">리뷰 작성 및 확인</a></li>
                     <li><a href="/MoHang/general/informationUpdateForm.do">회원 정보 수정</a></li>
                     <li><a href="#">로그 아웃</a></li>
                  </ul>
               </div>

            </div>


         </div>

      </div>
   </nav>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script type="text/javascript">
//마이페이지 다운 이벤트
$(document).click(function(e) {
   
   if($(e.target).attr('src')!='../resources/images/button.png'){
      $("#myPage1").css('display','none');
   }
   if($(e.target).attr('src')=='../resources/images/button.png'){
      $("#myPage1").toggle();
   }
})

</script>
</html>