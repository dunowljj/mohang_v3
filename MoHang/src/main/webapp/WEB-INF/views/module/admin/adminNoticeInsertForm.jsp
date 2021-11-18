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
<div id= "event detail1">
<div id="event_detail1_1">
		<span class="notice_title">공지사항 글쓰기</span>
</div>
<div id="event_detail2">
	<input type ="text"  placeholder="내용을 입력해주세요">
</div>
<div id="event_detail3">
	<textarea rows="5" cols="70" placeholder="내용을 입력해주세요"></textarea>
</div>
</div>
	<div>
		<a href="#"><button type="submit">이미지 불러오기</button></a>
	</div>
<div style="padding-top: 10px;">
	<button type="cancel">취소</button>
	<button type="submit">등록</button>
</div>
</div>
</div>
		<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</body>
</html>