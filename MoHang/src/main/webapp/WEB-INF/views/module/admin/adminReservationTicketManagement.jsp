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
	
	<div id="container-box1" style = "clear:both";>
	<div id="container">
	
	<p style="font-size: 30px; ">
		<span style="color: #000000;font-size: 20px;">행사 예약 티켓 관리</span>
	</p>
	
	행사정보
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
				<th scope="col"><font style="vertical-align: inherit;">이름</font></th>
				<th scope="col"><font style="vertical-align: inherit;">예약날짜</font></th>
				<th scope="col"><font style="vertical-align: inherit;">가격</font></th>
				<th scope="col"><font style="vertical-align: inherit;">예약현황</font></th>
				<th scope="col"><font style="vertical-align: inherit;">비고</font></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${ticket}" var="TicketReservationDTO">
			<tr>
				<c:if test="${TicketReservationDTO.ticket_reservation_check eq 'Y'}">
				<th scope="row"><font style="vertical-align: inherit;">${TicketReservationDTO.account_name}</font></th>
				<td><font style="vertical-align: inherit;">
						<fmt:formatDate value = "${TicketReservationDTO.ticket_reservation_time}" pattern="yyyy-MM-dd"/></font></td>
				<td><font style="vertical-align: inherit;">${TicketReservationDTO.ticket_reservation_price}</font></td>
				<td><font style="vertical-align: inherit;">${TicketReservationDTO.ticket_reservation_status}</font></td>
				<td><font style="vertical-align: inherit;"><a href="/admin/deleteTicket?ticket_reservation_num=${TicketReservationDTO.ticket_reservation_num}" ><button>예약취소</button></a></font></td>
				</c:if>
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
		<form id ="actionForm" action="/admin/listReservationTicket" method="get">
				<input type="hidden" name='pageNum' value="${pageMaker.cri.pageNum}">
				<input type="hidden" name='amount' value="${pageMaker.cri.amount}">	
				
		</form>
	
		
		
		 </div>
		</div>
<script type="text/javascript">	
		var actionForm= $("#actionForm");

			$(".page-item a").on("click",function(e){
				e.preventDefault();
				console.log("@@@@@@@");
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
})
</script>
		
		
		<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
		
</body>
</html>