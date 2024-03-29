<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/general_like-script.js"></script>
	
	<div id="container-box1" style='margin: 200px 0px;'>
		<div id="container">
			<div class='like_container'>
				<div class='general_subhead'>
					<h3>관심있는 행사</h3>
					<hr>
				</div>
					<!-- 행사 1 -->
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="nowDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
<!-- 					---------------noLike ---------------------------------->
<%-- 							<c:if test="${empty like}"> --%>
							<c:if test="${empty likeList}">
								<div id='empty_likeList'>
									<span>등록된 관심 행사가 없습니다.</span><br>
									<button type="button" onclick="location.href='/Main'">행사 보러 가기</button>
								</div>
							</c:if>
<!-- 					---------------noLike ---------------------------------->
					<div class='likeList_table_wrap'>
						<c:forEach var="like" items="${likeList}">
								<div class='like_one_wrap' style="${nowDate >= like.e_endDate ? '' : '' }">
									<input type='hidden' id="hidden_e_num" value="<c:out value='${like.account_num}'/>">
									<input type='hidden' id="hidden_account_num" value="<c:out value='${like.e_num}'/>">
									<div class='like_event_images'style="${nowDate >= like.e_endDate ? 'background-color:black;' : '' }" >
										<c:if test="${nowDate >= like.e_endDate}">
											<span class='like_event_image_end'>종료</span>
										</c:if>
										<img class="${nowDate >= like.e_endDate ? 'like_full_heart none':'like_full_heart'}"src='${pageContext.request.contextPath}/resources/images/찬하트.png' alt='좋아요'>
										<a href='/event/eventDetail?e_num=${like.e_num}'>
											<span class='like_event_image_wrap'>
												<img class="${nowDate >= like.e_endDate ? 'like_event_image_none':'like_event_image'}"style="${nowDate >= like.e_endDate ? 'background-color: #00000096;opacity: 0.6;' : '' }"  src="${pageContext.request.contextPath}/resources/images/${like.e_fname}" alt='like_event'>
											</span>
										</a>    
									</div> 
									<div class="like_one_wrap_bottom">
										<div class=''>
											<c:out value="${like.e_startDate}"/>~<c:out value="${like.e_endDate}"/>&nbsp;<c:out value="${like.eh_location}"/>
										</div>
										<div >
											<a href='/event/eventDetail?e_num=${like.e_num}'>
												<span class="eventSpan"><c:out value="${like.e_name}"/></span>
											</a>
										</div>
										<div class="like_event_bottom">
											<div>
												<c:if test="${like.e_price eq 0}">
													무료
												</c:if>
	<!-- 											style="background-color: black; color: white; padding: 3px 14px; font-size: 12px;" -->
												<c:if test="${like.e_price ne 0}">
													유료
												</c:if>
											</div>
										<div></div>
										<div>
											<span><i class="far fa-eye"></i></span>&nbsp;<c:out value="조회수 ${like.e_hitcount}"/>
										</div>
										</div>
									</div>	
								</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>			
	<script>

	
	
	
	
	
	</script>
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>

