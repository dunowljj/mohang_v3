<%@page import="org.mohang.domain.AccountVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/resources/css/general-style.css" rel="stylesheet" type="text/css"/>



<title>Insert title here</title>
</head>
<body>
<%-- <span>${account.account_name}님 반갑습니다</span> --%>
	<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/general-script.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/general_modal-script.js"></script>
	<div id="container-box1">
		<div id="container">
			<div class="general_wrapper">
				<div class="reserve_form_head">
					<h3>예약하기</h3><br>
					<h5></h5><hr>
				</div>
				<br>
				<div class='reserve_form'>
					<div class="form_left">
	<!-- 					<form action="" method="post" id='reserveForm' enctype="multipart/form-data"> -->
				
							<a><img src='${pageContext.request.contextPath}/resources/images/프로필.png' alt='user_image'
							style='border-radius:70%'></a>
<!-- 							<input type="file" name="fname"><br> -->
							<br>
							기본정보
							<hr><br>
							이메일(ID)	<br>
							<c:out value="${account.account_id}"/>@<c:out value="${account.account_email}"/>
							<br><br>
							이름/기업명<br>
							<c:out value="${account.account_name}"/>/<c:out value="${organization.o_name}"/>
							<br><br>
							전화번호 <br>
							<c:out value="${account.account_phoneNumber}"/>
	<!-- 					</form> -->
					</div>
					<div class="form_right">
							<div id='thum_wrap'>
								<img id='reserveThum' src='${pageContext.request.contextPath}/resources/images/${event.e_fname}' alt='${event.e_fname}'>
							</div>
							<c:out value="${event.e_name}"/><br>
						<form action="reserve" method="post" id='reserveForm' onsubmit='beforeSubmit()'>
							
							<c:if test="${0 ne event.e_price}">
								<span id='ticketPrice'><c:out value="${event.e_price}"/></span><span>원</span><br>
							</c:if>
							<c:if test="${0 eq event.e_price}">
								<span>무료</span><br>					
							</c:if>
								<span id='ticketCount'>1</span><span>매</span>
								<input type='button' onclick='count("plus")' value='+'/>
								<input type='button' onclick='count("minus")' value='-'/><br>
								<span>최종결제금액 : </span><span id='ticketTotal'><c:out value="${event.e_price}"/></span><span>원</span><br>
								<input type='date' name='ticket_reservation_date'
								 min='${event.e_startDate}' max='${event.e_endDate}' value='${event.e_startDate}'>
							
							
							<input type='hidden' name='e_num' value='<c:out value="${event.e_num}"/>'/>
							<input type='hidden' name='e_price' value='<c:out value="${event.e_price}"/>'/>
							<input type='hidden' id='ticket_reservation_amount' name='ticket_reservation_amount' value='1'/>
							<input type='hidden' id='ticket_payment_price' name='ticket_payment_price' value=''/>
							<input type='hidden' id='S_ticket_reservation_time' name='S_ticket_reservation_time' value=''/>
							<input type='hidden' id='S_ticket_payment_time' name='S_ticket_payment_time' value=''/>
<!-- 							<input type='hidden' id='ticket_reservation_time' name='ticket_reservation_time'> -->
							<input type='hidden' name='account_num' value='<c:out value="${account.account_num}"/>'/>
							<br>
							<button id='btn_payment_pop'>예약하기</button>
						
						
						<!-- pay modal -->
						<div class='pay_modal'>
							<c:out value="${event.e_name}"/><br>
							<span id='m_ticketPrice'><c:out value="${event.e_price}"/></span><span>원</span><br>
							<span id='m_ticketCount'>1</span><span>매</span>
<!-- 							<input type='button' onclick='count("plus")' value='+'/> -->
<!-- 							<input type='button' onclick='count("minus")' value='-'/> -->
							
							<br>
							
							<span>최종결제금액 : </span><span id='m_ticketTotal'><c:out value="${event.e_price}"/></span><span>원</span>
							<hr>
							<div class="payment_radio">
								<input type="radio" id="pay_card" name="ticket_payment_method" value="신용카드" checked>
								<label for="pay_card">신용카드</label>
								<input type="radio" id="pay_account" name="ticket_payment_method" value="가상계좌">
								<label for="pay_account">가상계좌</label>	
								<input type="radio" id="pay_runtime_account" name="ticket_payment_method" value="실시간계좌이체">
								<label for="pay_runtime_account">실시간 계좌이체</label>	
							</div>
	
							<br>
							<a href=''>약관1</a><button type="button" value="terms">약관</button><br>
							<a href=''>약관2</a><button type="button" value="terms">약관</button><br>
							<a href=''>약관3</a><button type="button" value="terms">약관</button><br>
							<input id='btn_payment' type="submit" value="결제하기">
						</div>
							
						<!-- pay modal -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="mask"></div>
	<script>
	var remainTicket = '<c:out value="${remainTicket}"/>';
	var e_num= '<c:out value="${event.e_num}"/>';

	//프로필 보이기
	var account_num = '<c:out value="${account.account_num}"/>';
	
	$.getJSON("/general/getAttach",{account_num: account_num}, function(attach){
		
        var uploadImg = $(".form_left img");
		var fileCallPath =  encodeURIComponent(attach.account_path + "/s_"+attach.account_uuid +"_"+attach.account_fileName);
		if(attach.account_fileName != null){
		uploadImg.attr('src', '/general/display?filename='+fileCallPath);
		}
		
	});
	
	
	</script>
	
	
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>








