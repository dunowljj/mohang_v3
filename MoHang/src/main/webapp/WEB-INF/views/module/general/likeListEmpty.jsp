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
				<div id='empty_likeList'>
					<span>등록된 관심 행사가 없습니다.</span><br>
					<button type="button" onclick="location.href=''">행사 보러 가기</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>

</body>
</html>