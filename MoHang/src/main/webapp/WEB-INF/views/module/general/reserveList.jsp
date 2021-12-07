<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/general-style.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/general_reserveList-script.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/general_modal-script.js"></script>
	<div id="container-box1" style='min-height:3000px'>
		<div id="container">
			<div class="general_wrapper">
				<div class="general_subhead">
					<h3>예약 확인</h3>
					<hr>
				</div>
				
				<table class='reserveList_table'>
		
		
				<c:forEach var='reserve' items='${reserveList}' varStatus="status">
					<tr class='reserveList_table_head'>
						<th class='reserveList_h1'>신청일</th>
						<th class='reserveList_h2'>신청행사</th>
						<th class='reserveList_h3'>상세내역</th>
						<th class='reserveList_h4'>결제 내역</th>
						<th class='reserveList_h5'>상태</th>
						<th class='reserveList_h6'>출석여부</th>
						<th class='reserveList_h7'>관리</th>
					</tr>
					
					<tr class='reserveList_row1'>
						<td class='reserveList_d1' rowspan="2">
							<c:out value="${reserve.ticket_reservation_time}"/>
							<div>진행중</div>
						</td>
						<td class='reserveList_d2'>
							<a href='/event/eventDetail?e_num=${reserve.e_num}'>
								<b><c:out value="${reserve.e_name}"/></b>
							</a>	
							<div class="img_reserveList">
								<a href='/event/eventDetail?e_num=${reserve.e_num}'>
									<img src='${pageContext.request.contextPath}/resources/images/${reserve.e_fname}' alt='reserveList_image'>
								</a>
							</div>
						</td>
						<td class='reserveList_d3'>
<%-- 						일시 : <fmt:formatDate value="${reserve.ticket_reservation_time}" pattern="yyyy-MM-dd HH:mm:ss"/><br> --%>
						일시 : <c:out value="${reserve.ticket_reservation_time}"/><br>
						행사 장소 : <c:out value="${reserve.eh_location}"/>
						</td>
						<td class='reserveList_d4'>
							최종금액 <c:out value="${reserve.ticket_payment_price}"/> 원
						</td>
						<td class='reserveList_d5'>
						</td>
						<td class='reserveList_d6'>
						<c:out value="${reserve.ticket_payment_status}"/>
						</td>
						<td class='reserveList_d7'>
							<c:if test="${'미참여' eq reserve.ticket_attend and '예약완료' eq reserve.ticket_reservation_status}">
								<button id='${status.index}' class='cancel_openMask' value="예약취소">예약취소</button><br>
							</c:if>
							<button id='${status.index}' class='ticket_openMask' value="상세보기">상세보기</button>
						</td>
					</tr>
					<tr class='reserveList_row2'>
						<td class='reserveList_d2'>
							<c:out value="${reserve.account_name}"/><br>
							<c:out value="${reserve.account_phoneNumber}"/><br>
							<c:out value="${reserve.account_id}"/>@<c:out value="${reserve.account_email}"/>
						</td>
						<td class='reserveList_d3'>
							수량:<c:out value="${reserve.ticket_reservation_amount}"/>
						</td>
						<td class='reserveList_d4'>
							<c:out value="${reserve.ticket_payment_price}"/>원
						</td>
						<td class='reserveList_d5'>
						</td>
						<td class='reserveList_d6'>
							<c:out value="${reserve.ticket_attend}"/>
						</td>
						<td class='reserveList_d7'>
							<c:if test="${'미참여' eq reserve.ticket_attend && '결제완료' eq reserve.ticket_payment_status}">
								<button class='' onclick='attendEvent(${reserve.ticket_reservation_num})' value="참여">참석하기</button>
									<form id="${reserve.ticket_reservation_num}" action='attendEvent' method='POST'>
										<input type='hidden' name='ticket_reservation_num' value="${reserve.ticket_reservation_num}">
									</form>
							</c:if>
						</td>
					</tr>
							
					</c:forEach>
					</table>
					
					
					<c:forEach var='reserve' items='${reserveList}' varStatus="status">
					<!-- 클릭하면 해당 값 구분해야함. closest 사용불가 -> 값은 이미 뿌려져있음 -> 해당 래퍼의 속성만 변경하면됨
					-> 하나 자식요소에 인덱스를 주고 parent 써서?..  클릭하는 순간 값을 알아야함, 버튼 아래에 히든태그나 속성으로 무언가를 넣기
					그 값을 받아서 자식요소 선택 후 부모에서 속성변경!
					$("cancel_form_image_wrap 3") 
					 -->
<form action='cancelReservation' class='cancel_form_modal ${status.index}' method='POST' onsubmit='cancelConfirm()'>
	<div class='cancel_form_image_wrap'>
		<img src='${pageContext.request.contextPath}/resources/images/${reserve.e_fname}'>
	</div>
	<div class='cancel_form_detail'>
	<h3>신청내역</h3>
		<div>
			신청자 정보<br>
			이름 : <c:out value="${reserve.account_name}"/>
		</div>
		<div>
			이메일 : <c:out value="${reserve.account_email}"/>
			<hr>
		</div>
		<div>
			전화번호 : <c:out value="${reserve.account_phoneNumber}"/><br>
			수량 : <c:out value="${reserve.ticket_reservation_amount}"/>매<br>
			금액 :  <c:out value="${reserve.ticket_reservation_amount}"/>원<br>
			결제금액 :  <c:out value="${reserve.ticket_payment_price}"/>원
		<input type='hidden' name='ticket_reservation_num' value='${reserve.ticket_reservation_num}'>
		</div>
	</div>
	<div class='cancel_form_btns'>
		<a class='btn_cancel_go'><input type='submit' value='신청취소'></a>
		<a class='cancel_close-area'>목록으로</a>
	</div>
</form>

<!-- cancel	modal end -->
<!-- ticket modal start -->
<div class='ticket_ModalPopup ${status.index}'>
	<div class='ticket_header'>
		<img>
<%-- 					 src='${pageContext.request.contextPath}/resources/images/steve2.jpg' alt='exh_image'> --%>
		<c:out value="${reserve.e_name}"/>
		</div>
		<div class='ticket_content' style='background:url("${pageContext.request.contextPath}/resources/images/${reserve.e_fname}");'>
		</div>
	<div class='ticket_footer'> 

		매수 :<c:out value="${reserve.ticket_reservation_amount}"/>매 
		신청기간 : <c:out value="${reserve.e_name}"/><br> 
		
		<span class='ticket_nano_title'>신청자 정보</span><br>
		이름 : <c:out value="${reserve.account_name}"/>  
		이메일 :<c:out value="${reserve.account_id}"/>@<c:out value="${reserve.account_email}"/><br>
<!-- 					연락처 : 010-xxxx-xxxx<br>   -->
		신청일 : <c:out value="${reserve.ticket_reservation_time}"/>
		<span id="ticket_code">티켓코드 : <c:out value="${reserve.ticket_reservation_num}"/></span>
	</div> 
</div>
	<!-- ticket modal end -->	
	</c:forEach>				
			
			
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
<!-- cancel	modal start -->
<div id='mask'></div>
		
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
   	<form id='actionForm' action="/general/listMyPartIn" method='get'>
		<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
    </form>
		
<!-- 	<div class="search"> -->
<!-- 		<form class="d-flex" id="searchForm" action="/review/review" method="get"> -->
<!-- 			<input class="form-control me-sm-2" type="text" name="keyword" placeholder="Search"> -->
<%--             <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>  --%>
<%--             <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' /> --%>
<!-- 			<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button> -->
<!-- 		</form> -->
<!-- 	</div> -->
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
</body>
</html>