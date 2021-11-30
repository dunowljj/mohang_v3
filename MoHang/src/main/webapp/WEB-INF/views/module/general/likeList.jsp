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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/general_like-script.js"></script>
	
	<div id="container-box1">
		<div id="container">
			<div class='like_container'>
				<div class='general_subhead'>
					<h3>관심있는 행사</h3>
					<hr>
				</div>
					<!-- 행사 1 -->
				<div class='like_row_container'>
					<div class='likeList_table_wrap'>
						<c:forEach var="like" items="${likeList}">
							<div class='like_one_wrap'>
<!-- 								<form> -->
								<input type='hidden' id="hidden_e_num" value="<c:out value='${like.account_num}'/>">
								<input type='hidden' id="hidden_account_num" value="<c:out value='${like.e_num}'/>">
<!-- 								</form> -->
								
								<div class='like_event_image'>
<%-- 									<a href="${status.index}"> --%>
									<img class='like_empty_heart'src='${pageContext.request.contextPath}/resources/images/찬하트.png' alt='하트'>
<!-- 									</a> -->
									<img class='like_event_images' src="${pageContext.request.contextPath}/resources/images/${like.e_fname}" alt='like_event'>
								</div> 
								<div class="like_one_wrap_bottom">
									<div class=''>
										<c:out value="${like.e_startRecruiteDate}"/><c:out value="${like.eh_location}"/>
									</div>
									<div class="">
										<span><c:out value="${like.e_name}"/></span>
									</div>
									<div class="like_event_bottom">
										<div>무료</div>
										<div>　</div>	
										<div><span><i class="far fa-eye"></i></span><c:out value="조회수 ${like.e_hitcount}"/></div>
									</div>
								</div>	
							</div>
						</c:forEach>
						<div class='like_one_wrap'>
							<div class='like_event_image'>
								<img class='like_empty_heart'src='${pageContext.request.contextPath}/resources/images/찬하트.png' alt=''>
								<img class='like_event_images' src='${pageContext.request.contextPath}/resources/images/행사1.jpg' alt='like_event'>
							</div>
							<div class=''>
								10월 30일(토) 금천구
							</div>
							<div class="">
								<span>kosta223기 인성교육</span>
							</div>
							<div class="like_event_bottom">
								<span>무료</span>	
								<span><span><i class="far fa-eye"></i></span>조회수xx</span>
							</div>	
						</div>
						
						<div class='like_one_wrap'>
							<div class='like_event_image'>
								<img class='like_empty_heart'src='${pageContext.request.contextPath}/resources/images/찬하트.png' alt=''>
								<img class='like_event_images' src='${pageContext.request.contextPath}/resources/images/행사2.jpg' alt='like_event'>
							</div>
							<div class=''>
								10월 30일(토) 금천구
							</div>
							<div class="">
								<span>kosta223기 인성교육</span>
							</div>
							<div class="like_event_bottom">
								<span>무료</span>	조회수xx
							</div>	
						</div>
						
						<div class='like_one_wrap'>
							<div class='like_event_image'>
								<img class='like_empty_heart'src='${pageContext.request.contextPath}/resources/images/찬하트.png' alt=''>
								<img class='like_event_images' src='${pageContext.request.contextPath}/resources/images/행사3.jpg' alt='like_event'>
							</div>
							<div class=''>
								10월 30일(토) 금천구
							</div>
							<div class="">
								<span>kosta223기 인성교육</span>
							</div>
							<div class="like_event_bottom">
								<span>무료</span>	
								<span><span><i class="far fa-eye"></i></span>조회수xx</span>
							</div>	
						</div>
						
						<div class='like_one_wrap'>
							<div class='like_event_image'>
								<img class='like_empty_heart'src='${pageContext.request.contextPath}/resources/images/찬하트.png' alt=''>
								<img class='like_event_images' src='${pageContext.request.contextPath}/resources/images/행사4.jpg' alt='like_event'>
							</div>
							<div class=''>
								10월 30일(토) 금천구
							</div>
							<div class="">
								<span>kosta223기 인성교육</span>
							</div>
							<div class="like_event_bottom">
								<span>무료</span>	
								<span><span><i class="far fa-eye"></i></span>조회수xx</span>
							</div>	
						</div>
						
						<div class='like_one_wrap'>
							<div class='like_event_image'>
								<img class='like_empty_heart'src='${pageContext.request.contextPath}/resources/images/찬하트.png' alt=''>
								<img class='like_event_images' src='${pageContext.request.contextPath}/resources/images/행사5.jpg' alt='like_event'>
							</div>
							<div class=''>
								10월 30일(토) 금천구
							</div>
							<div class="">
								<span>kosta223기 인성교육</span>
							</div>
							<div class="like_event_bottom">
								<span>무료</span>	
								<span><span><i class="far fa-eye"></i></span>조회수xx</span>
							</div>	
						</div>
						
						<div class='like_one_wrap'>
							<div class='like_event_image'>
								<img class='like_empty_heart'src='${pageContext.request.contextPath}/resources/images/찬하트.png' alt=''>
								<img class='like_event_images' src='${pageContext.request.contextPath}/resources/images/행사6.jpg' alt='like_event'>
							</div>
							<div class=''>
								10월 30일(토) 금천구
							</div>
							<div class="">
								<span>kosta223기 인성교육</span>
							</div>
							<div class="like_event_bottom">
								<span>무료</span>	
								<span><span><i class="far fa-eye"></i></span>조회수xx</span>
							</div>	
						</div>
						
						<div class='like_one_wrap'>
							<div class='like_event_image'>
								<img class='like_empty_heart'src='${pageContext.request.contextPath}/resources/images/찬하트.png' alt=''>
								<img class='like_event_images' src='${pageContext.request.contextPath}/resources/images/행사7.jpg' alt='like_event'>
							</div>
							<div class=''>
								10월 30일(토) 금천구
							</div>
							<div class="">
								<span>kosta223기 인성교육</span>
							</div>
							<div class="like_event_bottom">
								<span>무료</span>	
								<span><span><i class="far fa-eye"></i></span>조회수xx</span>
							</div>	
						</div>
						
						<div class='like_one_wrap'>
							<div class='like_event_image'>
								<img class='like_empty_heart'src='${pageContext.request.contextPath}/resources/images/찬하트.png' alt=''>
								<img class='like_event_images' src='${pageContext.request.contextPath}/resources/images/행사8.jpg' alt='like_event'>
							</div>
							<div class=''>
								10월 30일(토) 금천구
							</div>
							<div class="">
								<span>kosta223기 인성교육</span>
							</div>
							<div class="like_event_bottom">
								<span>무료</span>	
								<span><span><i class="far fa-eye"></i></span>조회수xx</span>
							</div>	
						</div>
						
						
					<!-- 행사 1 end -->
					</div>
					<!--  -->
				</div>
			</div>
		</div>			
	</div>
	<script>

	
	
	
	
	
	</script>
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>

