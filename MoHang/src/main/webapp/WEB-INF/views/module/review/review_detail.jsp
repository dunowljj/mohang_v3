<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
<script
		src="${pageContext.request.contextPath}/resources/js/reviewComment.js"
		type="text/javascript"></script>
		
<%@ page import="org.mohang.domain.AccountVO" %>	
<%   String account_num = (String)session.getAttribute("account_num");  %>

    <div id="header_nav">
		<ul>
			<li><a href="/search/searchform?field=사업/창업">사업/창업</a></li>
			<li><a href="/search/searchform?field=IT/개발">IT/개발</a></li>
			<li><a href="/search/searchform?field=마케팅/홍보">마케팅/홍보</a></li>
			<li><a href="/search/searchform?field=디자인/기획">디자인/기획</a></li>
			<li><a href="/search/searchform?field=문화/예술">문화/예술</a></li>
			<li><a href="/search/searchform?field=취미/생활">취미/생활</a></li>
			<li><a href="/search/searchform?field=건강/의료">건강/의료</a></li>
			<li><a href="/review/review">리뷰게시판</a></li>
		</ul>
	</div>

<div id="container-box1">
	<div id="container">
리뷰게시판
<hr>
제목 : ${Review.review_title }
<input type="hidden" name="review_num" value="<c:out value='${Review.review_num}'/>"/>
<br> 
참가한 행사 : ${Event.e_name }
<div class="star-ratings">
	<div  class="star-ratings-fill-space-x-2-text-lg" style="{width: ratingToPercent + '%' }">
		<div class="div_none"></div>
		<c:if test="${Review.review_scope eq 5 }">
			<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		</c:if>
		<c:if test="${Review.review_scope eq 4 }">
			<span>★</span><span>★</span><span>★</span><span>★</span><span>☆</span>
		</c:if>
		<c:if test="${Review.review_scope eq 3 }">
			<span>★</span><span>★</span><span>★</span><span>☆</span><span>☆</span>
		</c:if>
		<c:if test="${Review.review_scope eq 2 }">
			<span>★</span><span>★</span><span>☆</span><span>☆</span><span>☆</span>
		</c:if>
		<c:if test="${Review.review_scope eq 1 }">
			<span>★</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
		</c:if>
		<div style="width: 970px; display: inline-block;"></div>
		작성일 : <fmt:formatDate value ="${Review.review_date }" pattern = "yyyy-MM-dd"/>
		[조회수] ${Review.review_hitcount }
		<hr>
	</div>
</div>
<div>
	
</div>
<div class="review_content">
${Review.review_content }
</div>
<hr>
<div class="review_comment_box">

</div>

<hr>
<label for="exampleFormControlTextarea1" class="form-label">댓글쓰기</label>
<input  type ="hidden" name="loginAccountNum" value="${loginAccountNum }">
	<div class="textarea1">
  <textarea class="form-control" id="exampleFormControlTextarea1" name="review_comment_content" rows="5" cols="100"></textarea>
</div>
<div id ="btn">
	<button type="button" id="dark">등록</button>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>