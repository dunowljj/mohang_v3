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
				<h3>관심있는 행사</h3>
				<hr>
				</div>
				<!-- 행사 1 -->
				<div class='like_event_wrap'>
					<a href=''>
					<img class='like_event' src='${pageContext.request.contextPath}/resources/images/stevej.jpg' alt='like_event'>
					</a>
					<div class='like_event_exp'>
						<div class="like_event_top">
							<span>kosta223기 인성교육</span><span>무료</span>
							<span><br>10월 28일(목) 금천구</span><br>
						</div>
						<div class="like_event_bottom">
							조회수xx    <a href=''><img src='' alt='heart'></a>
						</div>	
					</div>
				</div>
				<!-- 행사 1 end -->
				<div class='like_event_wrap'>
					<a href=''>
					<img class='like_event' src='${pageContext.request.contextPath}/resources/images/stevej.jpg' alt='like_event'>
					</a>
					<div class='like_event_exp'>
						<div class="like_event_top">
							<span>기간지역</span><span>무료</span>
							<span><br>행사이름</span><br>
						</div>
						<div class="like_event_bottom">
							조회수xx    <a href=''><img src='' alt='heart'></a>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>