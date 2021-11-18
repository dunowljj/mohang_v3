<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Apply Form</title>


<link href="../resources/css/event.css" rel="stylesheet">

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>



</head>
<body>
<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/eventInsertForm.js" type="text/javascript"></script>

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
						<td class="tbinput "><input type="text" class="form-control"  id="small"
							placeholder="ex) 청춘 잡페어"></td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사기간</td>
						<td class="tbinput">
							<span class="goLeft"><input type="text" class="gray" id="fromDate" > 
							~ <input type="text" class="gray" id="toDate" > </span>
						</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">모집기간</td>
						<td class="tbinput">
							<span class="goLeft"><input type="text" class="gray" id="recruiteFromDate" > 
							~ <input type="text" class="gray" id="recruiteToDate" > </span>
						</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">대관장소</td>
						<td class="tbinput"><select
							class="form-select form-select-sm form-control"   id="small"
							aria-label=".form-select-sm example">
								<option selected>대관장소</option>	
								<option value="A">A 대여장</option>
								<option value="B">B 대여장</option>
								<option value="C">C 대여장</option>
								<option value="D">D 대여장</option>
								<option value="E">E 대여장</option>
						</select></td>
					</tr>
					<tr class="tr1">
						<td class="tbname">모집인원</td>
						<td class="tbinput"><input type="text"
							class="form-control half" placeholder="ex) 150"   id="small2"></td>
						<td class="bb">명</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사유형</td>
						<td class="tbinput"><select
							class="form-select form-select-sm form-control"
							aria-label=".form-select-sm example"   id="small">
								<option selected>택1</option>
								<option value="1">세미나/콘퍼런스</option>
								<option value="2">강의/교육</option>
								<option value="3">축제/공연</option>
						</select></td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사분야</td>
						<td class="tbinput"><select
							class="form-select form-select-sm form-control"
							aria-label=".form-select-sm example"   id="small">
								<option selected>택1</option>
								<option value="1">사업/창업</option>
								<option value="2">IT/개발</option>
								<option value="3">마케팅/홍보</option>
								<option value="4">디자인/기획</option>
								<option value="5">문화/예술</option>
								<option value="5">취미/생활</option>
								<option value="5">건강/의료</option>
						</select></td>
					</tr>
					<tr class="tr1">
						<td class="tbname">가격</td>
						<td class="tbinput"><input type="text"
							class="form-control" placeholder="5,000" name="e_price" id="e_priceSmall"  value=""></td>
						<td class="bb"><input type="checkbox"  name="e_priceCheck" id="e_priceCheck" onClick="checkDisable(this.form)" > 무료</td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사대표이미지</td>
						<td class="tbinput">
							<span class="goLeft"><img alt="image" src="">&nbsp&nbsp<input type="file" class="form-select-sm"></span></td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사상세이미지</td>
						<td class="tbinput">
							<span class="goLeft"><img alt="image" src="">&nbsp&nbsp<input type="file" class="form-select-sm"></span></td>
					</tr>
					<tr class="tr1">
						<td class="tbname">행사상세내용</td>
						<td><textarea class="gray textarea" rows="3" cols="50"></textarea></td>
					</tr>
				</table>
				<br> <br>
				<h6>
					<b>주최자 상세정보</b>
				</h6>

				<table class="tb">
					<tr>
						<td class="tbname">주최자 성함</td>
						<td class="tbinput"><input type="text" class="form-control"  placeholder="ex) 홍길동"></td>
					</tr>
					<tr>
						<td class="tbname">주최자 전화번호</td>
						<td class="tbinput"><input type="text" class="form-control"  placeholder="ex) 01012345678"></td>
					</tr>
					<tr>
						<td class="tbname">주최자 이메일</td>
						<td class="tbinput tdLength"><input type="text" class="gray half "> 
						@ <input type="text" class="gray half"></td>
						<td class="tbinput"><select
							class="form-select half form-select-sm"  id="small"
							aria-label="Default select example">
								<option selected>이메일 선택</option>
								<option value="1">naver.com</option>
								<option value="2">gmail.com</option>
								<option value="3">daum.net</option>
						</select></td>

					</tr>

				</table>
			</div>
			<!-- applyForm -->

			<div class="btnPage">
				<button type="button" class="btn btn-primary btn-sm" type="submit">제출</button>
				&nbsp&nbsp&nbsp&nbsp
				<button type="button" class="btn btn-secondary btn-sm" type="reset">취소</button>
			</div>
		</form>
	</div>
	<!-- applyPage -->
	</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>

</body>
</html>