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
	
	<p>
		<span style="color: #000000; font-size: 20px;">리뷰게시판</span>
	</p>
	
	<table class="table table-hover">
	<colgroup>
		 <col style="width:30px;">
		 <col style="width:150px;">
		 <col style="width:50px;">
		 <col style="width:70px;">
		 <col style="width:30px;">		 
	</colgroup>
		<thead>
			<tr class="table-active">
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">번호</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">제목</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">작성자</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">작성 날짜</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">조회수</font></font></th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty Review  }">
				<td></td>
				<td>등록된 게시물이 없습니다.</td>
				<td></td>
				<td></td>
				<td></td>
			</c:if>
			<c:forEach items= "${Review}" var ="review">
				<tr>
				<td>${review.review_num }</td>
				<td><a href="/review/review_detail?review_num=${review.review_num }&account_num=${review.account_num}&ticket_reservation_num=${review.ticket_reservation_num}">${review.review_title }</a></td>
				<td>${review.review_writer }</td>
				<td><fmt:formatDate value ="${review.review_date }" pattern = "yyyy-MM-dd"/></td>
				<td>${review.review_hitcount }</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>

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
		    	<form id='actionForm' action="/review/review" method='get'>
					<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			    </form>
		
			<div class="search">
				<form class="d-flex" id="searchForm" action="/review/review" method="get">
					<input class="form-control me-sm-2" type="text" name="keyword" placeholder="Search">
		            <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/> 
		            <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
				</div>
					</div>
<script>
var actionForm =$("#actionForm");

$(".page-item a").on(
		"click",
		function(e) {

			e.preventDefault();

			actionForm.find("input[name='pageNum']")
					.val($(this).attr("href"));
			var inputs = $("input[type='hidden']");
			actionForm.submit();
});
var searchForm = $("#searchForm");
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
		var inputs = $("input[type='hidden']");
		$(inputs[0]).val("");
		$(inputs[1]).val("");
		$(inputs[2]).val("");
		searchForm.submit();

});

</script>

		<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>