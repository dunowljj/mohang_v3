<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>

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
리뷰게시판
<hr>
<div class="star-ratings">
	<div  class="star-ratings-fill-space-x-2-text-lg" style="{ width: ratingToPercent + '%' }">
		<div class="div_none"></div><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		날짜    
		[조회수]
	</div>
</div>
<div>
	<img src="../resources/images/모행.png" alt="테스트입니다" width="800" height="100" />
</div>
리뷰내용
<hr>
<div id = "ee">
	작성자 날짜<br>
	댓글내용
</div>
<hr>
<label for="exampleFormControlTextarea1" class="form-label">댓글쓰기</label>
	<div class="textarea1">
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" cols="100"></textarea>
</div>
<div id ="btn">
	<button type="button" id="dark">등록</button>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>