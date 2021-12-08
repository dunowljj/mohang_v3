<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/general-style.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
	<div id="container-box1" style='min-height:1700px; margin-bottom:5%;'>
		<div id="container">
			<div class='general_wrapper' style='height:100%;'>
				<div class='general_subhead'>
					<h3>참가한 행사</h3>
					<hr>
				</div>
				<!-- 행사 1 -->
				
				<div class="entire_review_event" style='height:100%;'>
						<div class='pushpush'>
						<c:if test="${empty myPartInList}">
						참가한 행사가 없습니다.
						</c:if>
						<c:forEach items='${myPartInList}' var='myEvent'>
							<c:set var="myReserve" value="${myEvent.myReservationDTO}"/>
							<c:set var="myLike" value="${myEvent.likedVO}"/>
									<form id='toRivew ${myReserve.ticket_reservation_num}' action='review' method='GET'>
										<input type='hidden' name='ticket_reservation_num' value='<c:out value='${myReserve.ticket_reservation_num}'/>'>
										<input type='hidden' name='e_num' value='<c:out value='${myReserve.e_num}'/>'>
										<div class='review_event_wrap'>
											<a href=''>
												<img class='review_event' src='${pageContext.request.contextPath}/resources/images/${myReserve.e_fname}' alt='like_event'>
											</a>
											<div class='review_event_exp'>
												<div class="review_event_top">
													<span><c:out value='${myReserve.e_name}'/></span>
													<c:if test="${e_price eq 0}">
													<span>무료</span>
													</c:if>
													<c:if test="${e_price ne 0}">
													<span>유료</span>
													</c:if>
													
													<span><br><c:out value='${myReserve.eh_location}'/></span><br>
												</div>
													<div class="review_event_bottom">
														<span>
															참여날짜 : <fmt:formatDate value ="${myReserve.ticket_reservation_date}" pattern ="yyyy-MM-dd"/>
														</span>
														<span class="review_event_bottom2">
															조회수   <c:out value='${myReserve.e_hitcount}'/> 
<%-- 																<c:if test="${'1' eq myLike.like_status}"> --%>
<!-- 																	<a href=''> -->
<%-- 																		<img src='${pageContext.request.contextPath}/resources/images/찬하트.png' alt='좋아요'  --%>
<!-- 																			style='margin: 1px 8px;width: 28px;'> -->
<!-- 																	</a> -->
<%-- 																</c:if> --%>
<%-- 																<c:if test="${'0' eq myLike.like_status || empty myLike.like_status}"> --%>
<!-- 																<a href=''> -->
<%-- 																	<img src='${pageContext.request.contextPath}/resources/images/빈하트.png' alt='좋아요'  --%>
<!-- 																		style='margin: 1px 8px;width: 28px;'> -->
<!-- 																</a> -->
<%-- 																</c:if> --%>
													</span>
												</div>	
											</div>
											<div id='review_event_right'>
												<button id='btn_review' onclick='goReview(${myReserve.ticket_reservation_num})'>리뷰작성</button>
											</div>
										</div>
									</form>
						</c:forEach>
			<!-- 		행사 1 end -->
			<!-- 참가 목록 end -->
						</div>
							<div class='entire_reviewList'>
								<div class='general_subhead'>
								</div>
							</div>
								<div style='display: inline-block; width: 100%; margin-top: 70px;'>					
									<h5>내가 작성한 리뷰</h5>
									<hr>
								</div>
							<div>
							<div style='margin-bottom:20px; height:auto'>
								<table class="table table-hover">
									<tr class="table-active">
										<th style='width:8%;'>번호</th>
										<th style='width:40%;'>제목</th>
										<th style='width:13%;'>작성자</th>
										<th style='width:16%;'>작성일</th>
										<th style='width:13%;'>조회수</th>
										<th>별점</th>
									</tr>
									<c:forEach items='${review}' var='review'>
										<tr>
											<td><c:out value='${review.review_num}'/></td>
											<td>
												<a href="/review/review_detail?review_num=${review.review_num}&account_num=${review.account_num}&ticket_reservation_num=${review.ticket_reservation_num}">
													<c:out value='${review.review_title}'/>
												</a>
											</td>
											<td><c:out value='${review.review_writer}'/></td>
											<td><fmt:formatDate  value='${review.review_date}' pattern ="yyyy-MM-dd"/></td>
											<td><c:out value='${review.review_hitcount}'/></td>
											<td><c:out value='${review.review_scope}'/></td>
										</tr>
									</c:forEach>
								</table>
							</div>
							</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
	
</body>
</html>