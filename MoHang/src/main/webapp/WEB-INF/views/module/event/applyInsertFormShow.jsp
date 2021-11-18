

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Apply Form</title>


<link href="../resources/css/event.css" rel="stylesheet">





</head>
<body>
<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
<!--데이트피커사용url-->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/eventInsertForm.js" type="text/javascript"></script>
<!--데이트피커사용url-->

<div id="container-box1">
	<div id="container">
	<div class="applyPage">
		<div class="subTitle">
			<h3>행사 신청</h3>
		</div>
		<div class="subsubTitle">
			<br>
			<h6>주최할 행사의 상세내용을 입력하여 주세요 :)</h6>
			<br>
		</div>


		<form action="ApplyFormAction.java" method="post">
			<div class="applyForm">
					<h6><b>행사 상세정보</b></h6>
				<table class="tb">
					<tr class="tr1">
						<td class="tbname">행사명</td>
						<td class="s_tbcontent ">${event.o_name }aaaa</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사기간</td>
						<td class="s_tbcontent">
							 ${event.o_name }aaaa ~ ${event.o_name }aaaa
						</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">모집기간</td>
						<td class="s_tbcontent">
							${event.o_name }aaaa ~ ${event.o_name } aaaa
						</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">대관장소</td>
						<td class="s_tbcontent">${event.o_name }aaaa</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">모집인원</td>
						<td class="s_tbcontent">${event.o_name }aaaa명</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사유형</td>
						<td class="s_tbcontent">${event.o_name }aaaa</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사분야</td>
						<td class="s_tbcontent">${event.o_name }aaaa</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">가격</td>
						<td class="s_tbcontent"> ${event.o_name }aaaa</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사대표이미지</td>
						<td class="s_tbcontent">
							<img alt="image" src="">&nbsp&nbsp aaaa</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사상세이미지</td>
							<td class="s_tbcontent">
							<img alt="image" src="">&nbsp&nbsp aaaa</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사상세내용</td>
						<td class="s_tbcontent">aaaa</td>
					</tr>
				</table>
				<br> <br>
				<h6>
					<b>주최자 상세정보</b>
				</h6>

				<table class="tb">
					<tr>
						<td class="s_tbname">주최자 성함</td>
						<td class="s_tbcontent">${event.o_name }aaaa</td>
					</tr>
					<tr>
						<td class="s_tbname">주최자 전화번호</td>
						<td class="s_tbcontent">${event.o_name }aaaa</td>
					</tr>
					<tr>
						<td class="s_tbname">주최자 이메일</td>
						<td class="s_tbcontent tdLength">${event.o_name }aaaa</td>

					</tr>

				</table>
			</div>
			<!-- applyForm -->
		</form>
	</div>
	<!-- applyPage -->
	</div>
</div>



<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>

</body>
</html>