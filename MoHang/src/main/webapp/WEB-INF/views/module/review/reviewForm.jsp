<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<link rel = "stylesheet" type = "text/css" href = "${pageContext.request.contextPath}/resources/css/review_event_detail.css">

</head>


<body>
<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
	<div id="container-box">
		<div id="container">
			<form action="review" method="post">
				<div id="event detail1">
					<div id="event_detail1_1">
						<span class="notice_title">리뷰 글쓰기</span>
					</div>
					<div id="event_detail2">
					제목<br><input type="text" name='review_title' 
							placeholder="제목을 입력해주세요">
					</div>
					<div id="event_detail4"><br>
					작성자 : <c:out value='${account.account_name}'/>
					</div>
					<div id="event_detail3">
						<textarea rows="5" cols="70" name="review_content"
							placeholder="내용을 입력해주세요"></textarea>
					</div>
					
					<select name ='review_scope'>
						<option value="5">★★★★★</option>
						<option value="4">★★★★☆</option>
						<option value="3">★★★☆☆</option>
						<option value="2">★★☆☆☆</option>
						<option value="1">★☆☆☆☆</option>
					</select>
					<input type='hidden' name='account_num' value="<c:out value='${reserveDTO.account_num}'/>">
					<input type='hidden' name='ticket_reservation_num' value="<c:out value='${reserveDTO.ticket_reservation_num}'/>">
					<input type='hidden' name='e_num' value="<c:out value='${reserveDTO.e_num}'/>">
					<input type='hidden' name='review_writer' value="<c:out value='${account.account_name}'/>">
					
				</div>
				<div>
<!-- 					<a href="#"><button type="submit">이미지 불러오기</button></a> -->
				</div>
				<div style="padding-top: 10px;">
					<button type="button">취소</button>
					<button type="submit">등록</button>
	
				</div>
				</form>
		</div>
	</div>
		<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</body>
</html>