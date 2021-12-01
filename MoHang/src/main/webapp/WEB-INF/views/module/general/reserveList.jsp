<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/general-style.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/general-script.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/general_modal-script.js"></script>
	<div id="container-box1">
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
							<b><c:out value="${reserve.e_name}"/></b>
							<div class="img_reserveList"><img src='${pageContext.request.contextPath}/resources/images/${reserve.e_fname}' alt='reserveList_image'></div>
						</td>
						<td class='reserveList_d3'>
							2021.10.28(목)<br>
							09:00~16:00
							<c:out value="${reserve.eh_location}"/>
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
							<button id='${status.index}' class='cancel_openMask' value="예약취소">예약취소</button><br>
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
						<td class='reserveList_d6'></td>
						<td class='reserveList_d7'></td>
					</tr>
							
					</c:forEach>
					</table>
					
					
					<c:forEach var='reserve' items='${reserveList}' varStatus="status">
					<!-- 클릭하면 해당 값 구분해야함. closest 사용불가 -> 값은 이미 뿌려져있음 -> 해당 래퍼의 속성만 변경하면됨
					-> 하나 자식요소에 인덱스를 주고 parent 써서?..  클릭하는 순간 값을 알아야함, 버튼 아래에 히든태그나 속성으로 무언가를 넣기
					그 값을 받아서 자식요소 선택 후 부모에서 속성변경!
					$("cancel_form_image_wrap 3") 
					 -->
<form action='' class='cancel_form_modal ${status.index}'>
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
		
</body>
</html>