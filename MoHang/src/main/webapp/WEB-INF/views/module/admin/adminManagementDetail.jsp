<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Apply Form</title>


<link href="../resources/css/admin_main.css" rel="stylesheet">





</head>
<body>
<jsp:include page="/WEB-INF/views/comm/adminheader.jsp"></jsp:include>
<div style="display : none;">
<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
</div>
<script src="${pageContext.request.contextPath}/resources/js/eventInsertForm.js" type="text/javascript"></script>



<div id="container-box1">
	<div id="container">
	<div class="applyPage">
		<div class="subTitle">
			<h3>회원 정보</h3>
		</div>
		<div class="subsubTitle">
			<br>
		</div>


		<form action="ApplyFormAction.java" method="post">
			<div class="applyForm">
					<h6><b>회원상세정보</b></h6>
				<table class="tb">
					<tr class="tr1">
						<td class="tbname">이메일</td>
						<td class="s_tbcontent ">${event.o_name }aaaa</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">이름</td>
						<td class="s_tbcontent">
							 ${event.o_name }aaaa ~ ${event.o_name }aaaa
						</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">성별</td>
						<td class="s_tbcontent">
							${event.o_name }aaaa 
						</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">출생년도</td>
						<td class="s_tbcontent">${event.o_name }aaaa</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">전화번호</td>
						<td class="s_tbcontent">${event.o_name }aaaa명</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">관심사별 항목</td>
						<td class="s_tbcontent">${event.o_name }aaaa</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">회원프로필이미지</td>
						<td class="tr1">
							<img alt="image" src="../resources/images/대표이미지.png"></td>
					</tr>
				</table>
				
			</div>
			<!-- applyForm -->
		</form>
			<!-- button목록 부분 -->
				<div class="management_detail_button">
					<a href = "/MoHang/admin/AdminManagement.do">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">목록으로</button>
					</a>			
				</div>
	</div>
	<!-- applyPage -->
	</div>
</div>



<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>

</body>
</html></html>