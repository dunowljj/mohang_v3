

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
<link rel="preconnect" href="https://fonts.gstatic.com">

<link href="../resources/css/event.css" rel="stylesheet">

<style>
	*{font-family: 'Jua', sans-serif;}
	
</style>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="../resources/css/bootstrap.css" rel="stylesheet" />

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>



<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/event.js" type="text/javascript"></script> 

	
	<div id="container-box1" style = "clear:both" >
	<div id="container">
	
	<p style="font-size: 30px; margin-top:150px;">
		<span style="color: #000000;font-size: 20px;">My 행사 리스트</span>
	</p>
	
	<table class="table table-hover" id="applyList">
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
						style="vertical-align: inherit;">행사번호</font></font></th>
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
		
		
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
		

		<c:forEach items="${eventList}" var="event">
		
		<%-- <fmt:formatDate value="${event.e_startDate}" pattern="yyyyMMdd" var="startDate"/>
		<fmt:formatDate value="${event.e_endDate}" pattern="yyyyMMdd" var="endDate"/>
		 --%>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><c:out value="${event.e_num}"/></font></th>
				<td onclick="event.cancelBubble=true" ><a href="/event/getApply?e_num=${event.e_num}"><font style="vertical-align: inherit;"><c:out value="${event.e_name}"/></font></a></td>
				<td><font style="vertical-align: inherit;"><c:out value="${event.e_applyDate}"/></font></td>
				<td><div class="state"><font style="vertical-align: inherit;">
					<c:set var="check" value="${event.ap_check }"/>
						<c:if test="${check eq 'W' }"> 승인대기 </c:if>
						<c:if test="${check eq 'N' }"> 승인반려 </c:if>
						<c:if test="${check eq 'Y' }"> 승인완료/결제대기 </c:if>
						<c:if test="${check eq 'P' && today<event.e_startDate}">  행사대기 </c:if>
						<c:if test="${check eq 'P' && today>event.e_startDate &&  today<event.e_endDate}"> 행사진행중 </c:if>
						<c:if test="${check eq 'P' && today>event.e_endDate}"> 행사완료 </c:if>
						
						<input type="hidden" id="event_status" value="${event.ap_check }"/>
				</font></div></td>
				
				<td onclick="event.cancelBubble=true">
					<c:if test="${check eq 'W' }">
						<a href="/event/insertFormUpdate?e_num=${event.e_num}"><button>수정</button></a>
					</c:if>
					<c:if test="${check eq 'Y' }">
						<a href="/event/pay?ap_num=${event.ap_num}"><button>결제</button></a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="5" >
					<div class="listArccodian">
					<!-- 이미지+글조합 -->
						<div class="arccodianBox">
							<figure >
								<c:if test="${check ne 'W' }">
								<img src="../resources/images/승인1.png" alt="승인대기" class="imageSize" id="img1" style='opacity:0.3'/>
								<figcaption>승인대기</figcaption>
								</c:if>
								<c:if test="${check eq 'W' }"> 
								<img src="../resources/images/승인1.png" alt="승인대기" class="imageSize" id="img1" />
								<figcaption>승인대기</figcaption>
								</c:if>
							</figure>
				
							<figure>
							<c:if test="${check ne 'N' }"> 
								<img src="../resources/images/승인3.png" alt="승인반려" class="imageSize" id="img3" style='opacity:0.3'/>
								<figcaption>승인반려</figcaption>
							</c:if>
							<c:if test="${check eq 'N' }"> 
								<img src="../resources/images/승인3.png" alt="승인반려" class="imageSize" id="img3"/>
								<figcaption>승인반려</figcaption>
							</c:if>
							</figure>
							
							<figure>
							<c:if test="${check ne 'Y' }"> 
								<img src="../resources/images/승인4.png" alt="승인완료" class="imageSize" id="img4"  style='opacity:0.3'/>
								<figcaption>승인완료</figcaption>
							</c:if>
							<c:if test="${check eq 'Y' }"> 
								<img src="../resources/images/승인4.png" alt="승인완료" class="imageSize" id="img4"/>
								<figcaption>승인완료</figcaption>
							</c:if>
							</figure>
							
						<figure>
							<c:if test="${check ne 'Y' }"> 
								<img src="../resources/images/승인5.png" alt="결제대기" class="imageSize" id="img5" style='opacity:0.3'/>
								<figcaption>결제대기</figcaption>
							</c:if>
							<c:if test="${check eq 'Y' }"> 
								<img src="../resources/images/승인5.png" alt="결제대기" class="imageSize" id="img5"/>
								<figcaption>결제대기</figcaption>
							</c:if>
							</figure>
						
							<figure>
							<c:choose >
							<c:when test="${check eq 'P' && today<event.e_startDate}"> 
								<img src="../resources/images/승인6.png" alt="행사대기" class="imageSize" id="img6"/>
								<figcaption>행사대기</figcaption>
								</c:when>
								
								<c:when test="${ 'P' eq check}"> 
								<img src="../resources/images/승인6.png" alt="행사대기" class="imageSize" id="img6" style='opacity:0.3'/>
								<figcaption>행사대기</figcaption>
								</c:when>
								<c:when test="${ 'N' eq check}"> 
								<img src="../resources/images/승인6.png" alt="행사대기" class="imageSize" id="img6" style='opacity:0.3'/>
								<figcaption>행사대기</figcaption>
								</c:when>
								<c:when test="${ 'W' eq check}"> 
								<img src="../resources/images/승인6.png" alt="행사대기" class="imageSize" id="img6" style='opacity:0.3'/>
								<figcaption>행사대기</figcaption>
								</c:when>
								<c:when test="${ 'Y' eq check}"> 
								<img src="../resources/images/승인6.png" alt="행사대기" class="imageSize" id="img6" style='opacity:0.3'/>
								<figcaption>행사대기</figcaption>
								</c:when>
							</c:choose>
							</figure>
							
							<figure>
								<c:choose >
							<c:when test="${check eq 'P' && today>event.e_startDate &&  today<event.e_endDate}"> 
								<img src="../resources/images/승인7.png" alt="행사진행중" class="imageSize" id="img7"/>
								<figcaption>행사진행중</figcaption>
								</c:when>
							<c:when test="${ 'P' eq check}"> 
								<img src="../resources/images/승인7.png" alt="행사진행중" class="imageSize" id="img7" style='opacity:0.3'/>
								<figcaption>행사진행중</figcaption>
								</c:when>
								<c:when test="${ 'N' eq check}"> 
								<img src="../resources/images/승인7.png" alt="행사진행중" class="imageSize" id="img7" style='opacity:0.3'/>
								<figcaption>행사진행중</figcaption>
								</c:when>
								<c:when test="${ 'W' eq check}"> 
								<img src="../resources/images/승인7.png" alt="행사진행중" class="imageSize" id="img7" style='opacity:0.3'/>
								<figcaption>행사진행중</figcaption>
								</c:when>
								<c:when test="${ 'Y' eq check}"> 
								<img src="../resources/images/승인7.png" alt="행사진행중" class="imageSize" id="img7" style='opacity:0.3'/>
								<figcaption>행사진행중</figcaption>
								</c:when>
							</c:choose>
							</figure>
							
							<figure>
								<c:choose >
								<c:when test="${check eq 'P' && today>event.e_endDate}"> 
								<img src="../resources/images/승인8.png" alt="행사완료" class="imageSize" id="img8"/>
								<figcaption>행사완료</figcaption>
								</c:when>
								<c:when test="${ 'P' eq check}"> 
								<img src="../resources/images/승인8.png" alt="행사완료" class="imageSize" id="img8" style='opacity:0.3'/>
								<figcaption>행사완료</figcaption>
								</c:when>
								<c:when test="${ 'N' eq check}"> 
								<img src="../resources/images/승인8.png" alt="행사완료" class="imageSize" id="img8" style='opacity:0.3'/>
								<figcaption>행사완료</figcaption>
								</c:when>
								<c:when test="${ 'W' eq check}"> 
								<img src="../resources/images/승인8.png" alt="행사완료" class="imageSize" id="img8" style='opacity:0.3'/>
								<figcaption>행사완료</figcaption>
								</c:when>
								<c:when test="${ 'Y' eq check}"> 
								<img src="../resources/images/승인8.png" alt="행사완료" class="imageSize" id="img8" style='opacity:0.3'/>
								<figcaption>행사완료</figcaption>
								</c:when>
							</c:choose>
							</figure> 
						</div>
					</div>
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
    	<form id='actionForm' action="/event/listApply" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.keyword}'>
	    </form>
		
		<div class="search">
			<form class="d-flex" action="/event/listApply" method="get" id="searchForm">
				 <input class="form-control me-sm-2"type="text" placeholder="행사 제목을 입력하세요" name ="keyword" style="margin-top: 8px;height: 40px; width: auto;">
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