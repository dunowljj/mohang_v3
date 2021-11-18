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

<link rel = "stylesheet" type = "text/css" href = "${pageContext.request.contextPath}/resources/css/admin_main.css">


</head>
<body>
<jsp:include page="/WEB-INF/views/comm/adminheader.jsp"></jsp:include>


<div id = "admin_main2">
<div id="admin_main2_1">
		<div class='aaaa'>
			<a href = "/MoHang/admin/AdminApprove.do"><img src="../resources/images/1.jpg" alt="테스트입니다" width="200" height="200" /></a>
		<div>행사반려/승인</div>
		</div>
		<div class='aaaa'>
			<a href = "/MoHang/admin/AdminReservationTicket.do"><img src="../resources/images/2.jpg" alt="테스트입니다" width="200" height="200" /></a>
		<div>티켓예매</div>
		</div>
		<div class='aaaa'>
			<a href = "#"><img src="../resources/images/3.jpg" alt="테스트입니다" width="200" height="200" /></a>
		<div>일정관리</div>
		</div>
</div>
	<div id="admin_main2_2">
		<div class ="bbbb">
			<a href = "/MoHang/admin/AdminNotice.do"><img src="../resources/images/4.jpg" alt="테스트입니다" width="200" height="200" /></a>
				<div>게시판 관리</div>
		</div>
		<div class ="bbbb">
			<a href = "/MoHang/admin/AdminManagement.do"><img src="../resources/images/5.jpg" alt="테스트입니다" width="200" height="200" /></a>
				<div>회원관리</div>
		</div>
		<div class ="bbbb">
			<a href = "#"><img src="../resources/images/6.jpg" alt="테스트입니다" width="200" height="200" /></a>
				<div>메인슬라이드 관리</div>
		</div>
	

</body>
</html>




