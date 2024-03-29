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
	

	<div id="container-box1" style = "clear:both; padding-top: 50px;">
	<div id="container" style="padding-bottom: 60px;">
	
	
		<form class="d-flex" style=" float: left;" action="/admin/listNotice" method="get" id="searchForm">
			<input class="form-control me-sm-2"type="text" placeholder="제목을 입력하세요" name = "keyword" style=" width: auto;">
			<button class="btn btn-secondary my-2 my-sm-01" type="submit">Search</button>&nbsp;&nbsp;&nbsp;
		    <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/> 
		     <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
		</form>
		<a id="btn btn-secondary my-2 my-sm-02" class="btn_1" style="color:red; text-decoration:none;">공지사항</a>&nbsp;&nbsp;&nbsp;
		<a id="btn btn-secondary my-2 my-sm-03" class="btn_1" href="/admin/listReview" style="text-decoration:none;"> 리뷰</a>
	
	
	
	<table class="table table-hover"    style= "margin-top: 45px;">
	<colgroup>
	    <col style="width:30px;">	 
		 <col style="width:100px;">
		 <col style="width:150px; ">
		 <col style="width:50px;">
		 <col style="width:70px;">
		 <col style="width:30px;">	
		 <col style="width:70px;">	
		 
	</colgroup>
		<thead>
			<tr class="table-active">
				<th scope="col"><input type="checkbox" name="check" value="checkAll" id="checkAll" ></th>
				<th scope="col"><font style="vertical-align: inherit;">번호</font></th>
				<th scope="col"><font style="vertical-align: inherit;">제목</font></th>
				<th scope="col"><font style="vertical-align: inherit;">작성자</font></th>
				<th scope="col"><font style="vertical-align: inherit;">작성일</font></th>
				<th scope="col"><font style="vertical-align: inherit;">조회수</font></th>
				<th scope="col"><font style="vertical-align: inherit;">비고</font></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items= "${notice}" var ="NoticeVO" varStatus ="status">
			<tr>
			    <th scope="row"><input type="checkbox" name="checks" value="${NoticeVO.notice_num }"></th>
				<th scope="row"><font style="vertical-align: inherit;">${NoticeVO.notice_num}</font></th>
				<td><a href="/admin/noticeDetail?notice_num=${NoticeVO.notice_num}"><font style="vertical-align: inherit;">${NoticeVO.notice_title}</font></a></td>
				<td><font style="vertical-align: inherit;">${NoticeVO.notice_writer}</font></td>
				<td><font style="vertical-align: inherit;"><fmt:formatDate value ="${NoticeVO.notice_date}" pattern = "yyyy-MM-dd"/></font></td>
				<td><font style="vertical-align: inherit;">${NoticeVO.notice_hitcount}</font></td>
				<td><font style="vertical-align: inherit;"><a href="/admin/updateNoticeForm?notice_num=${NoticeVO.notice_num}" ><button>수정</button></a>
																				<a href="/admin/deleteNotice?notice_num=${NoticeVO.notice_num}"><button>삭제</button></a>
																					
				</font></td>
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
		<form id ="actionForm" action="/admin/listNotice" method="get">
				<input type="hidden" name='pageNum' value="${pageMaker.cri.pageNum}">
				<input type="hidden" name='amount' value="${pageMaker.cri.amount}">	
				<input type="hidden" name='keyword' value="${pageMaker.cri.keyword}">	
		</form>
	
		
		<div class="choice_cancel">
			<button type="button" class="btn btn-secondary btn-sm" name="delete" style="margin-top: 32px;
             	float: right;">전체삭제</a></button>
			<button type="button" class="btn btn-secondary btn-sm" style="margin-top: 32px;
             	float: right; margin-right: 20px;"><a href="/admin/noticeInsertForm" style="text-decoration:none;">글쓰기</a></button>
		</div>

	</div>
</div>

<script type="text/javascript">



</script>
		<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
</html>