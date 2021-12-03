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
	
	<p style="font-size: 30px; ">
		<div class = "Search" style="color: #000000;font-size: 20px; padding-top:50px;">회원정보
		<form class="d-flex" style=" float: right;">
			<input class="form-control me-sm-2"type="text" placeholder="Search" >
			<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
		</form>
		</div>
	</p>
	
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
				<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
				</li>
				<li class="page-item active"><a class="page-link" href="#">1</a>
				</li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">&raquo;</a>
				</li>
			</ul>
		</div>
		
		
		</div>
		</div>
		<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>