<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/comm/adminheader.jsp"></jsp:include>

<div class ="dd" style= "display : none">	
<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
</div>

<div id="container-box1">
	<div id="container">
공지사항게시판
<hr>
<div class="star-ratings">
	<div  class="star-ratings-fill-space-x-2-text-lg" style="{ width: ratingToPercent + '%' }">
		<div class="div_none"></div><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		날짜    
		[조회수] : ${detailNotice.notice_hitcount}
	</div>
</div>
<div>
</div>
 글 내용 : ${detailNotice.notice_content}
<hr>
<div id = "ee">
  작성자 :  ${detailNotice.notice_writer}  작성일자 : <fmt:formatDate value="${detailNotice.notice_date }" pattern="yyyy-MM-dd"/><br>
  댓글내용     
</div>
<hr>
<label for="exampleFormControlTextarea1" class="form-label">댓글쓰기</label>
	<div class="textarea1">
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" cols="100"></textarea>
</div>
<div id ="btn">
	<a href=""><button type="button" id="dark">등록</button></a>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>