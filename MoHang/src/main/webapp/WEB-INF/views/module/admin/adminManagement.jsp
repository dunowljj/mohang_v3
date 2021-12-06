<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<style>
	*{font-family: 'Jua', sans-serif;}
	
</style>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="../resources/css/bootstrap.css" rel="stylesheet" />
</head>
<body>

<jsp:include page="/WEB-INF/views/comm/adminheader.jsp"></jsp:include>


	
	<div id="container-box1" style = "clear:both";>
	<div id="container">
	
	
		<div class = "Search" style="color: #000000;font-size: 20px; padding-top:50px;">회원정보
		<form class="d-flex" style=" float: left;" action="/admin/listAccount" method="get" id="searchForm">
			<input class="form-control me-sm-2"type="text" placeholder="아이디를 입력하세요" name = "keyword" style=" width: auto;">
			<button class="btn btn-secondary my-2 my-sm-01" type="submit">Search</button>&nbsp;&nbsp;&nbsp;
		    <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/> 
		     <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
		</form>
		</div>
	
	
	<table class="table table-hover">
	<colgroup>
		 <col style="width:30px;">
		 <col style="width:150px;">
		 <col style="width:50px;">
		 <col style="width:70px;">
		 <col style="width:30px;">
		 <col style="width:30px;">		 
	</colgroup>
		<thead>
			<tr class="table-active">
				<th scope="col"><font style="vertical-align: inherit;">이름</font></th>
				<th scope="col"><font style="vertical-align: inherit;">아이디</font></th>
				<th scope="col"><font style="vertical-align: inherit;">전화번호</font></th>
				<th scope="col"><font style="vertical-align: inherit;">생년월일</font></th>
				<th scope="col"><font style="vertical-align: inherit;">삭제여부</font></th>
				<th scope="col"><font style="vertical-align: inherit;">비고</font></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${account}" var="account">
			<tr>
				<th scope="row"><font style="vertical-align: inherit;">${account.account_name}</font></th>
				<td><a href="/admin/accountDetail?account_num=${account.account_num }"><font
						style="vertical-align: inherit;">${account.account_id}</font></a></td>
				<td><font style="vertical-align: inherit;">${account.account_phoneNumber}</font></td>
				<td><font style="vertical-align: inherit;">${account.account_birth_date}</font></td>
				<td><font style="vertical-align: inherit;">${account.account_delete}</font></td>
				<td>
					<c:if test="${account.account_delete eq 'Y'}">
					<font style="vertical-align: inherit;"><a href="/admin/deleteAccount?account_num=${account.account_num}"><button>삭제</button></a></font>
				    </c:if>
				</td>
			</tr>
			</c:forEach>
		
			
		</tbody>
		</table>
<div class="page">
		<ul class="pagination">
		
				<c:if test="${pageMaker.prev }">
						<li class="page-item "><a class="page-link" href="${pageMaker.cri.pageNum -1}">&laquo;</a></li>
				 </c:if>
				<c:forEach  var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				  <li class="page-item  ${pageMaker.cri.pageNum == num ? "active":""} " >
					<a class="page-link" href="${num}">${num}</a>
			 	 </li>
				</c:forEach>
				
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link" href="${pageMaker.cri.pageNum +1 }">&raquo;</a></li>
				</c:if>	
			</ul>
</div>
		<form id ="actionForm" action="/admin/listAccount" method="get">
				<input type="hidden" name='pageNum' value="${pageMaker.cri.pageNum}">
				<input type="hidden" name='amount' value="${pageMaker.cri.amount}">	
				<input type="hidden" name='keyword' value="${pageMaker.cri.keyword}">	
		</form>
		
		
		</div>
	</div>
		<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
</html>