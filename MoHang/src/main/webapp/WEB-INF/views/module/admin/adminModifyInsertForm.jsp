<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<style>
	*{font-family: 'Jua', sans-serif;}
	
</style>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="../resources/css/bootstrap.css" rel="stylesheet" />

<link rel = "stylesheet" type = "text/css" href = "${pageContext.request.contextPath}/resources/css/admin_event_detail.css">

</head>


<body>
<div class ="dd" style= "display : none">	
<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
</div>


<jsp:include page="/WEB-INF/views/comm/adminheader.jsp"></jsp:include>
	<div id="container-box">
		<div id="container">
				<form action="updateNotice" method="post">
				<div id="event detail1">
					<div id="event_detail1_1">
						<span class="notice_title">공지사항 수정</span>
					</div>
						<div id="event_detail2">
							<input type="text" name="notice_title" value=" ${detailNotice.notice_title}">
						</div>
						<div id="event_detail3">
							<textarea rows="5" cols="70" name="notice_content"
								>${detailNotice.notice_content }</textarea>
						</div>
				</div>
				<div>
					<a href="#"><button type="submit">이미지 불러오기</button></a>
				</div>
				<div style="padding-top: 10px;">
					<button type="button">취소</button>
				<input type="hidden" name="notice_num" value="${detailNotice.notice_num}">
					<button type="submit">수정</button>
				</div>
				</form>
		</div>
	</div>
		<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</body>
</html>