<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/statistics.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
	<div id="container-box1">
		<div id="container">
			<div class='general_wrapper'>
				<div class='general_subhead'>
				<h3>종료된 행사 결과 분석리스트</h3>
				
					<div class="subsubTitle">
					<br>
					<h6>종료된 행사목록입니다. 클릭시 각 행사의 결과 분석 통계를 확인 할 수 있습니다.</h6>
					<h6>다음 행사 진행시 참고해 주세요 :)</h6>
					<br>
				</div>
				</div>
				
				
				<!-- 행사 1 -->
				<div class='like_event_wrap'>
				<a href="/MoHang/event/statisticsListDetail.do">
					<img class='like_event' src='${pageContext.request.contextPath}/resources/images/stevej.jpg' alt='like_event'>
				
					<div class='like_event_exp'>
						<div class="like_event_top">
							<span>kosta223기 인성교육</span><span>무료</span>
							<span><br>10월 28일(목) 금천구</span><br>
						</div>
						<div class="like_event_bottom">
							조회수xx <img src='' alt='heart'>
						</div>	
					</div>
					</a>
				</div>
				<!-- 행사 1 end -->
			
			
			
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>