<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/resources/css/general-style.css" rel="stylesheet" type="text/css"/>

<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/general-script.js"></script>
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
				
							<a><img src='${pageContext.request.contextPath}/resources/images/프로필.png' alt='user_image'></a>
							<input type="file" name="fname"><br>
							<br>
							기본정보
							<hr><br>
							이메일(ID)	<br>
							xxxxx@naver.com
							<br><br>
							이름/기업명<br>
							이상엽
							<br><br>
							전화번호 <br>
							010-xxxx-xxxx 
	<!-- 					</form> -->
					</div>
					<div class="form_right">
						<form action="" method="post" id='reserveForm' enctype="multipart/form-data">
							<input type='button' onclick='count("plus")' value='+'/>
							<input type='button' onclick='count("minus")' value='-'/>
							<div id='result'>0</div>
							<br>
							최종결제금액 : 원
							<hr>
							<div class="payment_radio">
								<input type="radio" id="pay_card" name="payment" value="pay_card" checked>
								<label for="pay_card">신용카드</label>
								<input type="radio" id="pay_account" name="payment" value="pay_accoun">
								<label for="pay_account">가상계좌</label>	
								<input type="radio" id="pay_runtime_account" name="payment" value="pay_runtime_account">
								<label for="pay_runtime_account">실시간 계좌이체</label>	
							</div>
							<hr>
							<br>
							<a href=''>약관1</a><button type="button" value="terms">약관</button><br>
							<a href=''>약관2</a><button type="button" value="terms">약관</button><br>
							<a href=''>약관3</a><button type="button" value="terms">약관</button><br>
							
						
							<input id='btn_payment' type="submit" value="결제하기">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>








