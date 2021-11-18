<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous"> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<style> *{font-family: 'Jua', sans-serif;} </style>
<!-- 인코딩 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- css적용 -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="../resources/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/comm/header.jsp" flush="false"></jsp:include>
	<div id="header_nav">
		<ul>
			<li><a href="/MoHang/search/eventsearch.do?field=모든 분야">전체</a></li>
			<li><a href="/MoHang/search/eventsearch.do?field=사업/창업">사업/창업</a></li>
			<li><a href="/MoHang/search/eventsearch.do?field=IT/개발">IT/개발</a></li>
			<li><a href="/MoHang/search/eventsearch.do?field=마케팅/홍보">마케팅/홍보</a></li>
			<li><a href="/MoHang/search/eventsearch.do?field=디자인/기획">디자인/기획</a></li>
			<li><a href="/MoHang/search/eventsearch.do?field=문화/예술">문화/예술</a></li>
			<li><a href="/MoHang/search/eventsearch.do?field=취미/생활">취미/생활</a></li>
			<li><a href="/MoHang/search/eventsearch.do?field=건강/의료">건강/의료</a></li>
			<li><a href="/MoHang/Review/ReviewList.do">리뷰게시판</a></li>
		</ul>
	</div>
	<div id="container-box1">
	<div id="container">

	<p>
		<span style="color: #000000; font-size: 20px;">공지사항</span>
	</p>

	<div class="accordion" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingOne">
				<button class="accordion-button" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseOne"
					aria-expanded="true" aria-controls="collapseOne">
					<p style="font-size: 20px">
						<strong style="color: #000000;">홈페이지 점검</strong>
					</p>
				</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse show"
				aria-labelledby="headingOne" data-bs-parent="#accordionExample"
				style="">
				<div class="accordion-body" style="color: #87CEEB;">
					2021.10.26~2100.10.26일까지 홈페이지 시스템 점검입니다. 사용자분들께 불편을 드려 죄송합니다.
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingTwo">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseTwo"
					aria-expanded="false" aria-controls="collapseTwo">
					<p style="font-size: 20px">
						<strong style="color: #000000;">이러쿵 저러쿵</strong>
					</p>
				</button>
			</h2>
			<div id="collapseTwo" class="accordion-collapse collapse"
				aria-labelledby="headingTwo" data-bs-parent="#accordionExample"
				style="">
				<div class="accordion-body" style="color: #87CEEB">
					어쩌구 저쩌구우ㅏ우ㅏ우ㅏ우ㅏ우아ㅜ아우ㅏ우ㅏ우ㅏ우ㅏ우아ㅜ아ㅜ아ㅜ아.
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingThree">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseThree"
					aria-expanded="false" aria-controls="collapseThree">
					<p style="font-size: 20px">
						<strong style="color: #000000;">바보멍청</strong>
					</p>
				</button>
			</h2>
			<div id="collapseThree" class="accordion-collapse collapse"
				aria-labelledby="headingThree" data-bs-parent="#accordionExample"
				style="">
				<div class="accordion-body" style="color: #87CEEB">
				우ㅏ우ㅏ우아ㅜ아우ㅏ우ㅏ우ㅏ우아ㅜ아ㅜ아ㅜ아우ㅏ우ㅏ우아
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>