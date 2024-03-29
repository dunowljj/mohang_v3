<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/statistics.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
	<div id="container-box1">
		<div id="container">
			<div class='general_wrapper'>
				<div class='general_subhead'>
				<h3>종료된 행사 결과 분석리스트</h3>
				
					<div class="subsubTitle">
					<br>
					<h6>종료된 행사목록입니다. 클릭시 각 행사의 결과 분석 통계를 확인 할 수 있습니다.</h6>
					<h6>다음 행사 진행시 참고해 주세요 :)</h6>
					<br>
				</div>
				</div>
				
				
				<!-- 행사 1 -->
			<c:forEach items="${endEventList}" var="endEvent" >
				<div class='like_event_wrap'>
				<a href="statisticsListDetail?e_num=${endEvent.e_num }">
					<img class='like_event' src='${pageContext.request.contextPath}/resources/images/${endEvent.e_fname }' alt='endEventList'/>
				
					<div class='like_event_exp'>
						<div class="like_event_top">
							<span>${endEvent.e_name }</span><span>${endEvent.e_price}원</span>
							<span><br>행사기간: ${endEvent.e_startDate } ~ ${endEvent.e_endDate }</span><br>
						</div>
						<div class="like_event_bottom">
							조회수: ${endEvent.e_hitcount }
						</div>	
					</div>
					</a>
				</div>
			</c:forEach>
				<!-- 행사 1 end -->
			
			<div class="page">
				<ul class="pagination">
				   <c:if test="${pageMaker.prev }">
						<li class="page-item "><a class="page-link" href="${pageMaker.cri.pageNum -1}">&laquo;</a></li>
				   </c:if>	
				   <c:forEach var="num" begin="${pageMaker.startPage}"
                     end="${pageMaker.endPage}">
                     <li class="page-item  ${pageMaker.cri.pageNum == num ? "active":""} " >
                        <a class="page-link" href="${num}">${num}</a>
                     </li>
                   </c:forEach>
                    <c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link" href="${pageMaker.cri.pageNum +1 }">&raquo;</a></li>
					</c:if>
				</ul>
		    </div>
	    	<form id='actionForm' action="/event/listStatistics" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.keyword}'>
		    </form>
			<form class="d-flex" style=" float: left;" action="/event/listStatistics" method="get" id="searchForm">
				 <input class="form-control me-sm-2"type="text" placeholder="행사 제목을 입력하세요" name ="keyword" style="width: auto;height:40px;margin-top: 8px;">
				 <button class="btn btn-secondary my-2 my-sm-01" type="submit">Search</button>&nbsp;&nbsp;&nbsp;
			     <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/> 
			     <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
			</form>
			</div>
			
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
	<script>
var actionForm =$("#actionForm");

$(".page-item a").on(
		"click",
		function(e) {

			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']")
					.val($(this).attr("href"));
			actionForm.submit();
});

var searchForm = $("#searchForm")
$("#searchForm button").on(
		"click",
		function(e) {


			if (!searchForm.find(
					"input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}

			searchForm.find("input[name='pageNum']")
					.val("1");
			e.preventDefault();

			searchForm.submit();

		});
</script>	
</body>
</html>