<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단체정보수정</title>

<script type="text/javascript" src="../resources/js/organization.js"></script>
<link href="../resources/css/organization.css" rel="stylesheet">

</head>
<body>

<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
<div id="container-box1">
	<div id="container">

	<div class="applyPage">
		<div class="subTitle">
			<h3>단체정보 변경</h3>
		</div>
		<div class="subsubTitle">
			<h6>단체정보를 정확히 기입해주세요:)</h6>
		</div>


		<form action="/organization/inforamtionUpdateForm">
			<div class="applyForm">
				<table class="tb">
					<tr>
						<td class="tbname">단체명</td>
						<td class="tbinput"><input type="text" class="form-control" name="o_name"
							value='<c:out value="${organization.o_name}"/>' readonly="readonly"></td>
					</tr>
					<tr>
						<td class="tbname">단체홈페이지</td>
						<td class="tbinput"><input type="text" class="form-control" name="o_name"
							value='<c:out value="${organization.o_homepage}"/>' readonly="readonly"></td>
					</tr>
					<tr>
						<td class="tbname">단체전화번호</td>
						<td class="tbinput">
						<input type="text" class="form-control" name="o_name"
							value='<c:out value="${organization.o_phoneNumber}"/>'  readonly="readonly"></td>
					</tr>
				</table>
			</div>
			<!-- applyForm -->

			<div class="btnPage">
			
				<button type="button" class="btn btn-primary btn-sm" type="submit">수정</button>
			</div>
	</form>
	</div>
	<!-- applyPage -->
</div>
</div>
<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>