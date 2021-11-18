<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/general-style.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
	<div id="container-box1">
		<div id="container">
			<div class='general_wrapper'>
				<div class='general_subhead'>
					<h3>참가한 행사</h3>
					<hr>
				</div>
				<!-- 행사 1 -->
				<div class="entire_review_event">
					<div class='review_event_wrap'>
						<a href=''>
						<img class='review_event' src='${pageContext.request.contextPath}/resources/images/stevej.jpg' alt='like_event'>
						</a>
						<div class='review_event_exp'>
							<div class="review_event_top">
								<span>kosta223기 인성교육</span><span>무료</span>
								<span><br>10월 28일(목) 금천구</span><br>
							</div>
							<div class="review_event_bottom">
								조회수xx    <a href=''><img src='' alt='heart'></a>
							</div>	
						</div>
						<div id='review_event_right'>
							<a href=''><button>리뷰작성</button></a>
						</div>
					</div>
			<!-- 		행사 1 end -->
					<div class='review_event_wrap'>
						<a href=''>
						<img class='review_event' src='${pageContext.request.contextPath}/resources/images/steve2.jpg' alt='like_event'>
						</a>
						<div class='review_event_exp'>
							<div class="review_event_top">
								<span>기간지역</span><span>무료</span>
								<span><br>행사이름</span><br>
							</div>
							<div class="review_event_bottom">
								조회수xx    <a href=''><img src='' alt='heart'></a>
							</div>	
						</div>
						<div id='review_event_right'>
							<a href=''><button>리뷰작성</button></a>
						</div>
					</div>
					<div class='review_event_wrap'>
						<a href=''>
						<img class='review_event' src='${pageContext.request.contextPath}/resources/images/steve3.jpg' alt='like_event'>
						</a>
						<div class='review_event_exp'>
							<div class="review_event_top">
								<span>기간지역</span><span>무료</span>
								<span><br>행사이름</span><br>
							</div>
							<div class="review_event_bottom">
								조회수xx    <a href=''><img src='' alt='heart'></a>
							</div>	
						</div>
						<div id='review_event_right'>
							<a href=''><button>리뷰작성</button></a>
						</div>
					</div>
					<div class='review_event_wrap'>
						<a href=''>
						<img class='review_event' src='${pageContext.request.contextPath}/resources/images/steve4.jpg' alt='like_event'>
						</a>
						<div class='review_event_exp'>
							<div class="review_event_top">
								<span>기간지역</span><span>무료</span>
								<span><br>행사이름</span><br>
							</div>
							<div class="review_event_bottom">
								조회수xx    <a href=''><img src='' alt='heart'></a>
							</div>	
						</div>
						<div id='review_event_right'>
							<a href=''><button>리뷰작성</button></a>
						</div>
					</div>
				</div>
				
			<!-- 참가 목록 end -->
				<div class='entire_reviewList'>
					<div class='general_subhead'>
						<h5>내가 작성한 리뷰</h5>
						<hr>
					</div>
					<table id="reviewList_table" border='1'>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>별점</th>
						</tr>
						<tr>
							<td>xx</td>
							<td>명강의였습니다.</td>
							<td>이정준</td>
							<td>2021.10.25</td>
							<td>10</td>
							<td>별</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
	
</body>
</html>