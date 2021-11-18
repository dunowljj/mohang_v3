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
	<div id="container-box1">
		<div id="container">
			<div class="general_wrapper">
				<div class="general_subhead">
					<h3>예약 확인</h3>
					<hr>
				</div>
				<table class='reserveList_table'>
					<tr class='reserveList_table_head'>
						<th class='reserveList_h1'>신청일</th>
						<th class='reserveList_h2'>신청행사</th>
						<th class='reserveList_h3'>일시</th>
						<th class='reserveList_h4'>행사장 위치</th>
						<th class='reserveList_h5'>결제 내역</th>
						<th class='reserveList_h6'>관리</th>
						<th class='reserveList_h7'>상태</th>
					</tr>
					<tr class='reserveList_row1'>
						<td class='reserveList_d1'rowspan='2'>
							2021.10.24
							(12:42:30)
							<div>진행중</div>
						</td>
						<td class='reserveList_d2'>
							<b>코스타 223기 인성교육 "화성 입국 면접"</b>
							<div class="img_reserveList"><img src='${pageContext.request.contextPath}/resources/images/1ron.jpg' alt='reserveList_image'></div>
						</td>
						<td class='reserveList_d3'>2021.10.28(목)<br>
						09:00~16:00
						</td>
						<td class='reserveList_d4'>kosta 가산 </td>
						<td class='reserveList_d5'>최종금액 	 xxx원</td>
						<td class='reserveList_d6'>
							<button class='cancel_openMask' value="예약취소">예약취소</button><br>
							<button class='ticket_openMask' value="상세보기">상세보기</button>
						</td>
						<td class='reserveList_d7'>결제완료</td>
					</tr>
					<tr class='reserveList_row2'>
						<td class='reserveList_d2'>
						이정준<br>
						01046666218<br>
						uuufg3322@naver.com
						</td>
						<td class='reserveList_d3'></td>
						<td class='reserveList_d4'></td>
						<td class='reserveList_d5'></td>
						<td class='reserveList_d6'>수량</td>
						<td class='reserveList_d7'></td>
					</tr>
					<!--더미2 시작-->
					<tr class='reserveList_row1'>
						<td class='reserveList_d1'rowspan='2'>
							2021.10.24
							(12:42:30)
							<div>진행중</div>
						</td>
						<td class='reserveList_d2'>
							<b>코스타 223기 인성교육 "화성 입국 면접"</b>
							<div class="img_reserveList"><img src='${pageContext.request.contextPath}/resources/images/1ron.jpg' alt='reserveList_image'></div>
						</td>
						<td class='reserveList_d3'>2021.10.28(목)<br>
						09:00~16:00
						</td>
						<td class='reserveList_d4'>kosta 가산 </td>
						<td class='reserveList_d5'>최종금액 	 xxx원</td>
						<td class='reserveList_d6'>
							<button class='cancel_openMask' value="예약취소">예약취소</button><br>
							<button class='ticket_openMask' value="상세보기">상세보기</button>
						</td>
						<td class='reserveList_d7'>결제완료</td>
					</tr>
					<tr class='reserveList_row2'>
						<td class='reserveList_d2'>
						이정준<br>
						01046666218<br>
						uuufg3322@naver.com
						</td>
						<td class='reserveList_d3'></td>
						<td class='reserveList_d4'></td>
						<td class='reserveList_d5'></td>
						<td class='reserveList_d6'>수량</td>
						<td class='reserveList_d7'></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
<!-- cancel	modal start -->
<div id='mask'></div>
		<form action='' class='cancel_form_modal'>
			<div class='cancel_form_image_wrap'>
				<img src='${pageContext.request.contextPath}/resources/images/steve2.jpg'>
			</div>
			<div class='cancel_form_detail'>
			<h3>신청내역</h3>
				<div>
					신청자 정보<br>
					이름
				</div>
				<div>
					이메일
					<hr>
				</div>
				<div>
					전화번호 : 010-xxxx-xxxx<br>
					수량 : 2매<br>
					금액 : x원<br>
					결제금액 : x원
				</div>
			</div>
			<div class='cancel_form_btns'>
				<a class='btn_cancel_go'><input type='submit' value='신청취소'></a>
				<a class='cancel_close-area'>목록으로</a>
			</div>
		</form>

<!-- cancel	modal end -->
<!-- ticket modal start -->
		<div class='ticket_ModalPopup'>
		 		<div class='ticket_header'>
					<img>
<%-- 					 src='${pageContext.request.contextPath}/resources/images/steve2.jpg' alt='exh_image'> --%>
					kosta 233기 인성교육 
		 		</div>
		 		<div class='ticket_content'>
		 		</div>
				<div class='ticket_footer'> 
					매수 : 2매 
					신청기간 : xxxx.xx.xx<br> 
					<span class='ticket_nano_title'>신청자 정보</span><br>
					이름 : 홍길동   이메일 : abc@gmail.com<br>
<!-- 					연락처 : 010-xxxx-xxxx<br>   -->
					신청일 2021년 10월 28일 09시 00분
					티켓코드 : 12345789 
				</div> 
		</div>
		
		<div></div>
<!-- ticket modal end -->
</body>
</html>