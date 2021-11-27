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
	<!--데이트피커링크  -->
<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>  

	<script
		src="${pageContext.request.contextPath}/resources/js/eventInsertForm.js"
		type="text/javascript"></script>
	<!--데이트피커링크  -->
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


				<form action="/event/insertApply" method="post">
				
					 <div class="applyForm">
						<table class="tb">
							<h6>
								<b>행사 상세정보</b>
							</h6>
							<tr class="tr1">
								<td class="tbname">행사명</td>
								<td class="tbinput "><input type="text"
									class="form-control" id="small" name="e_name" placeholder="ex) 청춘 잡페어"></td>
							</tr>
							<tr class="tr1">
								<td class="tbname">행사기간</td>
								<td class="tbinput">
									<div class="period">
									
										<input type="text" class="gray" id="fromDate" name="e_startDate" >
										~ 
										<input type="text" class="gray" id="toDate" name="e_endDate">
									</div>
								</td>
							</tr>
							<tr class="tr1">
								<td class="tbname">모집기간</td>
								<td class="tbinput">
									<div class="period">
										<input type="text" class="gray" id="recruiteFromDate" name="e_startRecruiteDate">
										~ 
										<input type="text" class="gray" id="recruiteToDate" name="e_endRecruiteDate">
									</div>
								</td>
							</tr>
							<tr class="tr1">
								<td class="tbname">대관장소</td>
								<td class="tbinput">
									<select class="form-select form-select-sm form-control" id="small"
									aria-label=".form-select-sm example" name="eh_reservation_num">
										<option selected>대관장소 택1</option>
										<option value="A">A 대여장</option>
										<option value="B">B 대여장</option>
										<option value="C">C 대여장</option>
										<option value="D">D 대여장</option>
										<option value="E">E 대여장</option>
								</select></td>
							</tr>
							<tr class="tr1">
								<td class="tbname">모집인원</td>
								<td class="tbinput">
									<input type="text"class="form-control half" name="e_recruitePeople" placeholder="ex) 150" id="small2"></td>
								<td class="bb">명</td>
							</tr>
							<tr class="tr1">
								<td class="tbname">행사유형</td>
								<td class="tbinput"><select
									class="form-select form-select-sm form-control"
									aria-label=".form-select-sm example" id="small" name="e_type">
										<option selected>택1</option>
										<option value="세미나/콘퍼런스">세미나/콘퍼런스</option>
										<option value="강의/교육">강의/교육</option>
										<option value="축제/공연">축제/공연</option>
								</select></td>
							</tr>
							<tr class="tr1">
								<td class="tbname">행사분야</td>
								<td class="tbinput"><select
									class="form-select form-select-sm form-control"
									aria-label=".form-select-sm example" id="small" name="e_field">
										<option selected>택1</option>
										<option value="사업/창업">사업/창업</option>
										<option value="IT/개발">IT/개발</option>
										<option value="마케팅/홍보">마케팅/홍보</option>
										<option value="디자인/기획">디자인/기획</option>
										<option value="문화/예술">문화/예술</option>
										<option value="취미/생활">취미/생활</option>
										<option value="건강/의료">건강/의료</option>
								</select></td>
							</tr>
							<tr class="tr1">
								<td class="tbname">가격</td>
								<td class="tbinput"><input type="text" class="form-control"
									placeholder="5,000" name="e_price" id="e_priceSmall" value="120">
									<div class="checkBox">
										<input type="checkbox" name="e_priceCheck" id="e_priceCheck"
											onClick="checkDisable(this.form)"> 무료
									</div></td>
							</tr>
							<tr class="tr1">
								<td class="tbname">행사대표이미지</td>
								<td class="tbinput">
									<div class="goLeft">
										<img alt="image" src="" id="titleImage" width="30%" >&nbsp&nbsp
										<input type="file" class="form-select-sm" accept='image/*'
											onchange='openFile(event)' name="e_fname">
									</div>
								</td>
							</tr>
							<tr class="tr1">
								<td class="tbname">행사상세이미지</td>
								<td class="tbinput">
									<div class="goLeft">
										<img alt="image" src="" id="contentImage" width="30%">&nbsp&nbsp
										<input type="file" class="form-select-sm" accept='image/*'
											onchange='openFile2(event)' name="e_dfname">
									</div>
								</td>
							</tr>
							<tr class="tr1">
								<td class="tbname">행사상세내용</td>
								<td><textarea class="gray textarea" rows="3" cols="50" name="e_detail"></textarea></td>
							</tr>
						</table>
						<br> <br>
						<h6>
							<b>주최자 상세정보</b>
						</h6>

						<table class="tb">
							<tr>
								<td class="tbname">주최자 성함</td>
								<td class="tbinput"><input type="text" class="form-control"  id="small" 
									placeholder="ex) 홍길동" name="e_personName"></td>
							</tr>
							<tr>
								<td class="tbname">주최자 전화번호</td>
								<td class="tbinput"><input type="text" class="form-control"  id="small" 
									placeholder="ex) 01012345678" name="e_personPhoneNumber"></td>
							</tr>
							<tr>
								<td class="tbname">주최자 이메일</td>
								<td class="tbinput"><input type="text" class="form-control"  id="small" 
									placeholder="ex) gildong01@naver.com" name="e_personEmail"></td>
<!-- 								<td class="tbinput tdLength">
<!-- 									<input type="text" class="gray half" name="email1"> -->
<!-- 									 @  -->
<!-- 									 <input type="text"class="gray half" name="email2"></td> -->
<!-- 								<td class="tbinput"> -->
<!-- 									<select class="form-select half form-select-sm" id="small" aria-label="Default select example"> -->
<!-- 										<option selected>이메일 선택</option> -->
<!-- 										<option value="naver.com">naver.com</option> -->
<!-- 										<option value="gmail.com">gmail.com</option> -->
<!-- 										<option value="daum.net">daum.net</option> -->
<!-- 									</select> -->
<!-- 								</td>  -->

							</tr>

						</table>
					</div>
				<!-- 	applyForm -->
					<br> 
					<div class="btnPage">
						<button class="btn btn-primary btn-sm" type="submit">제출</button>
						&nbsp&nbsp&nbsp&nbsp
						<button class="btn btn-secondary btn-sm" type="reset">취소</button>
					</div>
				</form>
			</div>
			<!-- applyPage -->
		</div>
	</div>



	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>

</body>
</html>