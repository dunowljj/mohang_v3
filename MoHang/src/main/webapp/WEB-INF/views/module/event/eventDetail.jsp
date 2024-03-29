<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./resources/css/bootstrap.min.css" type="text/css"
	rel="stylesheet" />
<link href="./resources/css/bootstrap.css" type="text/css"
	rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="/your-path-to-fontawesome/css/all.css" rel="stylesheet">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="org.mohang.domain.AccountVO" %>
<%
	AccountVO account = (AccountVO)session.getAttribute("account");
%>
<style>
* {
	font-family: 'Jua', sans-serif;
}
/* 	img.absolute {
		position: absolute;
		left: 500px;
		top: 100px
	}
	div.bg-light mb-3{
		left: 1000px;
	}*/
button.btn-primary {
	position: absolute;
	left: 885px;
}

button.btn-success {
	position: absolute;
	left: 1000px;
}

button.btn-light {
	position: absolute;
	left: 1120px;
}
</style>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
</head>
<body>

	<jsp:include page="/WEB-INF/views/comm/header.jsp" flush="false"></jsp:include>
	<script type="text/javascript">
		$(function() {
			$("#like").on('click', function() {
				var account_num = 1;
				var e_num = $("input[name='e_num']").val();
				console.log('test :' + e_num);
				$.ajax({
					type : 'post',
					url : '/event/like',
					data : {
						'account_num' : account_num,
						'e_num' : e_num
					},
					success : function(result, status, xhr) {
						location.reload();
					},
					error : function(xhr, status, er) {

					}
				})
			})
		})
		
		function reserve(){
			var e_num = $("input[name='e_num']").val();
			location.href='/general/reserve?e_num='+e_num;
		}
		
		function chatAdd(){
			var o_num = $("input[name='o_num']").val();
			location.href='/chat/add?o_num='+o_num;
		}
	</script>
	<div id="header_nav">
		<ul>
			<li><a href="/search/searchform?field=모든 분야" class="on">전체</a></li>
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

		<div id="container">
			<img src="../resources/images/${event.e_fname }" style="float: left;"
				height="318" width="500px">
			<div class="box">
				<div class="card bg-light mb-3"
					style="max-width: 26rem; height: 320px;">
					<div class="card-header">
						전시회정보
						<div style="display: inline-block; padding-left: 350px;">
						<%if(account != null) {%>
							<c:if test="${48 == liked.like_status }">
								<img src="../resources/images/빈하트.png"
									style="width: 20px; height: 20px;">
							</c:if>
							<c:if test="${49 == liked.like_status }">
								<img src="../resources/images/찬하트.png"
									style="width: 20px; height: 20px;">
							</c:if>
						<%} else{%>
							<c:if test="${48 == liked.like_status }">
								<img src="../resources/images/빈하트.png"
									style="width: 20px; height: 20px;">
							</c:if>
							<c:if test="${49 == liked.like_status }">
								<img src="../resources/images/찬하트.png"
									style="width: 20px; height: 20px;">
							</c:if>
						<%}%>
						</div>
					</div>
					<div class="card-body" style="padding: 2rem 1rem;">
						<p class="card-text">
							기간:
							<fmt:formatDate pattern="yyyy-MM-dd"
								value="${event.e_startDate }" />
							~
							<fmt:formatDate pattern="yyyy-MM-dd" value="${event.e_endDate }" />

							<br> 장소: ${eventhall.eh_location } <br> 단체:
							${organization.o_name } <br> 전화번호:
							${event.e_personPhoneNumber } <br> 담당자: ${event.e_personName }
							<br> 이메일: ${event.e_personEmail } <br> 홈페이지:
							${organization.o_homepage }
						</p>
					</div>
				</div>
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
				<%if(account != null) {%>
				<c:if test="${sysYear<=event.e_endDate }">
				<button type="button" id="like" class="btn btn-primary">좋아요</button>
				</c:if>
				<%} %>
				<input type="hidden" name="e_num" value="${event.e_num}">
				<input type="hidden" name="o_num" value="${event.o_num}">
				<c:if test="${sysYear<=event.e_endDate }">
				<button type="button" class="btn btn-success" onclick="reserve();">예약하기</button>
				</c:if>
				<button type="button" class="btn btn-light" onclick="chatAdd();">1:1 채팅문의</button>
			</div>
		</div>
		
		<div style="margin-left: 320px; margin-top: 150px;">
		<img src="../resources/images/${event.e_dfname }" class="absolute"
			width="300px" height="300px">
		<hr>
		<h1 style="font-size: 30px; margin-top: 30px; margin-bottom: 13rem;">
			<span style="color: #000000; font-size: 40px;">${event.e_detail }</span>
		</h1>
	</div>
	

	
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>

</body>
</html>