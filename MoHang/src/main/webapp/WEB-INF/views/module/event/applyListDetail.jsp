

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

<div id="container-box1">
	<div id="container">
	<div class="applyPage">
		<div class="subTitle">
			<h3>행사 신청 정보</h3>
		</div>
		<div class="subsubTitle">
			<br>
			<h6>신청한 행사의 상세내용을 확인하여 주세요 :)</h6>
			<br>
		</div>


			<div class="applyForm">
					<h6><b>행사 상세정보</b></h6>
				<table class="tb">
					<tr class="tr1">
						<td class="tbname">행사명</td>
						<td class="s_tbcontent ">${event.e_name}</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사기간</td>
						<td class="s_tbcontent">
							 ${event.e_startDate } ~ ${event.e_endDate }
						</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">모집기간</td>
						<td class="s_tbcontent">
							${event.e_startRecruiteDate } ~ ${event.e_endRecruiteDate}
						</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">대관장소</td>
						<td class="s_tbcontent" id="eh_num">${event.eh_num}이거수정</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">모집인원</td>
						<td class="s_tbcontent">${event.e_recruitePeople } 명</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사유형</td>
						<td class="s_tbcontent">${event.e_type }</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사분야</td>
						<td class="s_tbcontent">${event.e_field }</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">가격</td>
						<td class="s_tbcontent"> ${event.e_price }</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사대표이미지</td>
						<td class="s_tbcontent">
							<img alt="image" src="">이거 불러오는거까지가 주말 목표</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사상세이미지</td>
							<td class="s_tbcontent">
							<img alt="image" src="">이거 불러오는거까지가 주말 목표</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사상세내용</td>
						<td class="s_tbcontent">${event.e_detail }</td>
					</tr>
				</table>
				<br> <br>
				<h6>
					<b>주최자 상세정보</b>
				</h6>

				<table class="tb">
					<tr>
						<td class="s_tbname">주최자 성함</td>
						<td class="s_tbcontent">${event.e_personName }</td>
					</tr>
					<tr>
						<td class="s_tbname">주최자 전화번호</td>
						<td class="s_tbcontent">${event.e_personPhoneNumber }</td>
					</tr>
					<tr>
						<td class="s_tbname">주최자 이메일</td>
						<td class="s_tbcontent tdLength">${event.e_personEmail }</td>
					</tr>

				</table>
			</div>
			<!-- applyForm -->
			<br>
				<div class="btnPage">
					<a href="/event/insertFormUpdate?e_num=${event.e_num }"><button type="button" class="btn btn-primary btn-sm">정보 수정</button></a>
				</div>	
	</div>
	<!-- applyPage -->
	</div>
</div>



<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>

</body>
</html>