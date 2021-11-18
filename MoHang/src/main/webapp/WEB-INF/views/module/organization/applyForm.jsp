<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단체정보신청</title>

<link href="../resources/css/organization.css" rel="stylesheet">

</head>
<body>
<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
<div id="container-box1">
	<div id="container">

	<div class="applyPage">
		<div class="subTitle">
			<h3>단체정보 신청</h3>
		</div>
		<div class="subsubTitle">
		<br>
			<h6>행사를 신청하기 위해 단체정보를 입력하여 주세요 :)</h6>
		<br>
		</div>


		<form  action="applyFormInsertAction.do" method="post">
			<div class="applyForm">
				<table class="tb">
					<tr>
						<td class="tbname">단체명</td>
						<td class="tbinput">
							<input type="text" class="form-control aa" name="o_name"placeholder="ex) 우리강산푸르게">
						</td>
					</tr>
					<tr>
						<td class="tbname">단체홈페이지</td>
						<td class="tbinput">
							<input type="text" class="form-control aa" name="o_homepage"placeholder="ex) www.green.org">
						</td>
					</tr>
					<tr>
						<td class="tbname">단체전화번호</td>
						<td class="tbinput">
							<input type="text" class="form-control aa" name="o_phonenumber"placeholder="ex) 02-0000-0000">
						</td>
					</tr>
				</table>
			</div>
			<!-- applyForm -->
			<br>
			<div class="btnPage">
				<input class="btn btn-primary btn-sm" type="submit" value="제출">
				&nbsp&nbsp&nbsp&nbsp
				<input class="btn btn-secondary btn-sm" type="reset" value="취소">
			</div>
	</form>
	</div>
	<!-- applyPage -->
</div>
</div>
<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>

</body>
</html>