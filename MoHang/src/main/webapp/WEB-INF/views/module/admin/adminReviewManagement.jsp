<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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

	
	<div id="container-box1" style = "clear:both; padding-top: 70px;">
	<div id="container" style="padding-bottom: 60px;">
	
	
		<form class="d-flex" style=" float: left;" action="/admin/listReview" method="get" id="reviewSearchForm">
			<input class="form-control me-sm-2"type="text" placeholder="제목을 입력하세요" name = "keyword" style=" width: auto;">
			<button class="btn btn-secondary my-2 my-sm-01" type="submit">Search</button>&nbsp;&nbsp;&nbsp;
		    <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/> 
		     <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
		</form>
		<a id="btn btn-secondary my-2 my-sm-02" class="btn_1" href= "/admin/listNotice" style="text-decoration:none;">공지사항</a>&nbsp;&nbsp;&nbsp;
		<a id="btn btn-secondary my-2 my-sm-03" class="btn_1" href="/MoHang/admin/AdminReview.do" style ="color:red; text-decoration:none;"> 리뷰</a>
	
	
	
	<table class="table table-hover"  style="margin-top: 25px;" >
	<colgroup>
	    <col style="width:30px;">	 
		 <col style="width:100px;">
		 <col style="width:150px; ">
		 <col style="width:50px;">
		 <col style="width:70px;">
		 <col style="width:30px;">	
		 <col style="width:50px;">	
		 
	</colgroup>
		<thead>
			<tr class="table-active">
				<th scop="col"><input type="checkbox"></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">번호</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">제목</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">작성자</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">작성일</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">조회수</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;"></font></font></th>
				</tr>
		</thead>
		<tbody>
			<c:forEach items = "${review}" var = "ReviewVO">
			<tr>
			    <th scope="row"><input type="checkbox"></th>
				<th scope="row"><font style="vertical-align: inherit;">${ReviewVO.review_num }</font></th>
				<td><a href="/admin/detailReview?review_num=${ReviewVO.review_num }"><font style="vertical-align: inherit;">${ReviewVO.review_title}</font></a></td>
				<td><font style="vertical-align: inherit;">${ReviewVO.review_writer }</font></td>
				<td><font style="vertical-align: inherit;">
				<fmt:formatDate value="${ReviewVO.review_date}" pattern ="yyyy-MM-dd"/>
				</font></td>
				<td><font style="vertical-align: inherit;">${ReviewVO.review_scope }</font></td>
				<td><font style="vertical-align: inherit;">
						<a href="/admin/deleteReview?review_num=${ReviewVO.review_num}" ><button>삭제</button></a>
				</font></td>
				
				<!-- <td><font style="vertical-align: inherit;"><button>수정</button>&nbsp;<button>삭제</button></font></td> -->
			</tr>
			</c:forEach>
			
			
		</tbody>
		</table>
<div class="page">
		<ul class="pagination">
		
				<c:if test="${pageMaker.prev}">
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
		<form id ="actionForm" action="/admin/listReview" method="get">
				<input type="hidden" name='pageNum' value="${pageMaker.cri.pageNum}">
				<input type="hidden" name='amount' value="${pageMaker.cri.amount}">	
				<input type="hidden" name='keyword' value="${pageMaker.cri.keyword}">		
		</form>
		
		<div class="choice_cancel">
			<button type="button" class="btn btn-secondary btn-sm" type="reset" style="margin-top: 32px;
             float: right;">선택삭제</button>
		</div>
		
		</div>
		</div>
		<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin.js"></script>	
</body>
</html>