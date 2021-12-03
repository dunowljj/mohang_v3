<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>MoHang?</title>

<!-- <link href="../resources/css/bootstrap.min.css" rel="stylesheet" /> -->
<!-- <link href="../resources/css/bootstrap.css" rel="stylesheet" /> -->
</head>
<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>

<script type="text/javascript" src="../resources/js/view.js"></script>
<script type="text/javascript">


</script>
<div id="carouselExampleControls" class="carousel slide"
	data-bs-ride="carousel">
	<div id="header_nav">
		<ul>
			<li><a href="/search/searchform?field=사업/창업">사업/창업</a></li>
			<li><a href="/search/searchform?field=IT/개발">IT/개발</a></li>
			<li><a href="/search/searchform?field=마케팅/홍보">마케팅/홍보</a></li>
			<li><a href="/search/searchform?field=디자인/기획">디자인/기획</a></li>
			<li><a href="/search/searchform?field=문화/예술">문화/예술</a></li>
			<li><a href="/search/searchform?field=취미/생활">취미/생활</a></li>
			<li><a href="/search/searchform?field=건강/의료">건강/의료</a></li>
			<li><a href="/review/review">리뷰게시판</a></li>
		</ul>
	</div>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="../resources/images/main(1).jpg" class="d-block w-100"
				alt="...">
		</div>
		<div class="carousel-item">
			<img src="../resources/images/main(2).jpg" class="d-block w-100"
				alt="...">
		</div>

	</div>
	<button class="carousel-control-prev" type="button"
		data-bs-target="#carouselExampleControls" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#carouselExampleControls" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
</div>



<div id="container-box">
	<div id="container">
		<div class="month_event_box">
			<p class="title">이달의 행사 일정</p>
			<form action="" method="post" id="year_monthform">
				<input type="hidden" name="year" value=""> <input
					type="hidden" name="month" value="">
				<div class="day_box">
					<a href="#" id="year_prev"><img
						src="../resources/images/prev.png"></a>
					<div id="month"></div>
					<a href="#" id="year_next"><img
						src="../resources/images/next.png"></a>
				</div>
				<!-- 			로그인 세션에 있는 값 -->
				<input type="hidden" name="account_Interest" value="문화/예술" />
				<!-- 			로그인 세션에 있는 값 -->
				<input type="hidden" name="account_num" value="1" />
				<div id="day"></div>
				<div class="month_event_box_in"></div>
			</form>
		</div>
		<p class="title">추천 행사</p>
		<div class="slider-div"></div>
		<p class="title">베스트 행사</p>
		<div class="slider-div"></div>
	</div>
</div>

<div id="Notice_container">
		<div id="Notice">
			<ul>
				<li><a href="#">공지사항</a></li>
				<li>|</li>
				<li><a href="/notice/notice">${notice.notice_title}</a></li>
			</ul>
		</div>
</div>

<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../resources/js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>

</html>