<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<h3>참가한 행사</h3>
					<hr>
				</div>
				<!-- 행사 1 -->
				
				<div class="entire_review_event">
					<c:forEach items='${myPartInList}' var='myEvent'>
						<c:set var="myReserve" value="${myEvent.myReservationDTO}"/>
						<c:set var="myLike" value="${myEvent.likedVO}"/>
							<c:if test="${'참여' eq myReserve.ticket_attend}">
								<form id='toRivew ${myReserve.ticket_reservation_num}' action='review' method='GET'>
									<input type='hidden' name='' value='<c:out value='${myReserve.ticket_reservation_num}'/>'>
									<input type='hidden' name='' value='<c:out value='${myReserve.e_num}'/>'>
									<div class='review_event_wrap'>
										<a href=''>
											<img class='review_event' src='${pageContext.request.contextPath}/resources/images/${myReserve.e_fname}' alt='like_event'>
										</a>
										<div class='review_event_exp'>
											<div class="review_event_top">
												<span><c:out value='${myReserve.e_name}'/></span><span>무료</span>
												<span><br><c:out value='${myReserve.eh_location}'/></span><br>
											</div>
											<div class="review_event_bottom">
												<span>행사참여날짜 : <c:out value='${myReserve.ticket_reservation_date}'/></span>
												
												<span class="review_event_bottom2">
													조회수   <c:out value='${myReserve.e_hitcount}'/> 
													<c:if test="${'1' eq myLike.like_status}">
													<a href=''>
														<img src='${pageContext.request.contextPath}/resources/images/찬하트.png' alt='좋아요' 
															style='margin: 1px 8px;width: 28px;'>
													</a>
													</c:if>
													<c:if test="${'0' eq myLike.like_status}">
													<a href=''>
														<img src='${pageContext.request.contextPath}/resources/images/빈하트.png' alt='좋아요' 
															style='margin: 1px 8px;width: 28px;'>
													</a>
													</c:if>
													
												</span>
											</div>	
										</div>
										<div id='review_event_right'>
											<button id='btn_review' onclick='goReview(${myReserve.ticket_reservation_num})'>리뷰작성</button>
										</div>
									</div>
								</form>
							</c:if>
					</c:forEach>
			<!-- 		행사 1 end -->
			<!-- 참가 목록 end -->
					<div class='entire_reviewList'>
						<div class='general_subhead'>
							<h5>내가 작성한 리뷰</h5>
							<hr>
						</div>
						<table id="reviewList_table" border='1'>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>별점</th>
							</tr>
							<tr>
								<td>xx</td>
								<td>명강의였습니다.</td>
								<td>이정준</td>
								<td>2021.10.25</td>
								<td>10</td>
								<td>별</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
	
</body>
</html>