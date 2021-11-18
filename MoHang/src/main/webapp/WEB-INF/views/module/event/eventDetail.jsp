<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./resources/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="./resources/css/bootstrap.css" type="text/css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="/your-path-to-fontawesome/css/all.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	*{font-family: 'Jua', sans-serif;}
/* 	img.absolute {
		position: absolute;
		left: 500px;
		top: 100px
	}
	div.bg-light mb-3{
		left: 1000px;
	}*/
	button.btn-primary{
		position: absolute;
		left: 885px;
	}
	button.btn-success{
		position: absolute;
		left: 1000px;
	}
	button.btn-light{
		position: absolute;
		left: 1120px;
	}
</style>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/comm/header.jsp" flush="false"></jsp:include>
	<div id="header_nav">
		<ul>
			<li><a href="#">전체</a></li>
			<li><a href="#">사업/창업</a></li>
			<li><a href="#">IT/개발</a></li>
			<li><a href="#">마케팅/홍보</a></li>
			<li><a href="#">디자인/기획</a></li>
			<li><a href="#">문화/예술</a></li>
			<li><a href="#">취미/생활</a></li>
			<li><a href="#">건강/의료</a></li>
			<li><a href="/MoHang/Review/ReviewList.do">리뷰게시판</a></li>
		</ul>
	</div>
	<div id="container-box1">
	<div id="container">
  <img src="../resources/images/행사1.jpg" style="float: left;" height="318">
  <div class="box">
  <div class="card bg-light mb-3" style="max-width: 21rem;">
  <div class="card-header">전시회정보<div style="display: inline-block; padding-left: 210px;"><img src="../resources/images/빈하트.png" style="width: 20px; height: 20px;"></div></div>
  <div class="card-body" style="padding: 2rem 1rem;">
    <p class="card-text">기간: 2021-10-14 ~ 2021-10-17
    <br>
   						시간: 10:00 ~ 18:00
	<br>
						장소: 제1전시실, 제2전시실
	<br>
						주최: 이엑스스포테인먼트
	<br>
						전화번호: 02-3456-2751
	<br>
						팩스번호:
	<br>					
						담당자: 조성철 팀장
	<br>					
						이메일: thegolfshow@naver.com
	<br>
						홈페이지: https://www.theleisureshow.co.kr/</p>
  </div>
</div>
	<button type="button" class="btn btn-primary">좋아요</button>
	<button type="button" class="btn btn-success">예약하기</button>
	<button type="button" class="btn btn-light"><a href="/MoHang/chat/ChatFormAction.do" target="_blank">1:1 채팅문의</a></button>

</div>
</div>
<div style="margin-left: 320px; margin-top: 150px;"><img src="../resources/images/행사2.jpg" class="absolute" width="300px" height="300px">
	<img src="../resources/images/행사3.jpg" class="absolute" width="300px" height="300px">
	<img src="../resources/images/행사4.jpg" class="absolute" width="300px" height="300px"></div>
	
	<h1 style="font-size:30px; margin-top: 30px; margin-bottom: 13rem; margin-left: 320px;">
		<span style="color: #000000;">행사정보를 입력하세요~!~!</span>
	</h1>
</div>
<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>