<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
리뷰게시판
<hr>
<div class="star-ratings">
	<div  class="star-ratings-fill-space-x-2-text-lg" style="{ width: ratingToPercent + '%' }">
		<div class="div_none"></div><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		날짜    
		[조회수] : ${detailReview.review_hitcount}
	</div>
</div>

 글 내용 : ${detailReview.review_content}
<hr>
<div id = "ee">

  작성자 :  ${detailReview.review_writer}  작성일자 : <fmt:formatDate value="${detailReview.review_date }" pattern="yyyy-MM-dd"/><br>  
</div>
<hr>


</div>
</div>
<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>