<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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


<div class ="dd" style= "display : none">	
<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
	
	<div id="container-box1" style = "clear:both";>
	<div id="container">
	
	<p style="font-size: 30px; ">
		<span style="color: #000000;font-size: 20px;">행사반려/승인기능</span>
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
						style="vertical-align: inherit;">행사제목</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">신청날짜</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">진행 상황</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">비고</font></font></th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach items="${approve}" var="approveDTO">
			<tr>
				<th scope="row"><font style="vertical-align: inherit;">${approveDTO.ap_num}</font></th>
				<td><a href="/admin/detailApprove?e_num=${approveDTO.e_num}"><font style="vertical-align: inherit;">
						${approveDTO.e_name}</font></a></td>
				<td><font style="vertical-align: inherit;">
				<fmt:formatDate value="${approveDTO.ap_date}" pattern="yyyy-MM-dd"/>
						</font></td>
				<td>
						<c:set var ="check" value="${approveDTO.ap_check}"/>
						
						<c:if test="${check eq 'Y'}">승인완료</c:if>
						<c:if test="${check eq 'W'}">승인대기</c:if>
						<c:if test="${check eq 'N'}">승인반려</c:if>
			
				</td>
				<td>
			  
					<c:if test="${check eq 'W'}">
						<a href="/admin/deleteApprove?ap_num=${approveDTO.ap_num}" ><button >반려</button></a>
						<a href="/admin/listApprovebtn?ap_num=${approveDTO.ap_num}" ><button class="btn1" >승인</button>
						</a>
				</c:if>		
						
<!-- 						onclick= "btn_hide()" -->
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
		<form id ="actionForm" action="/admin/listApprove" method="get">
				<input type="hidden" name='pageNum' value="${pageMaker.cri.pageNum}">
				<input type="hidden" name='amount' value="${pageMaker.cri.amount}">	
				<input type="hidden" name='keyword' value="${pageMaker.cri.keyword}">	
		</form>
		
		<div class="search">
			<form class="d-flex" style=" float: left;" action="/admin/listApprove" method="get" id="searchForm">
			<input class="form-control me-sm-2"type="text" placeholder="글번호를 입력하세요" name = "keyword" style=" width: auto;">
			<button class="btn btn-secondary my-2 my-sm-01" type="submit">Search</button>&nbsp;&nbsp;&nbsp;
		    <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/> 
		     <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
		</form>
		</div>
 </div>
</div>
		<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
</html>