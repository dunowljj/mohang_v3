<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<style>
* {
	font-family: 'Jua', sans-serif;
}
</style>
<!-- 인코딩 -->
<!-- css적용 -->
<!-- <link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="../resources/css/bootstrap.css" rel="stylesheet" /> -->
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
	<div id="container-box">
		<div id="container">
			<div>
				<a href="/Main"> <img src="../resources/images/로고.png"
					style="margin-left: 800px;"></a>
			</div>

			<div class="form-group"
				style="line-height: 30px; text-align: center;">
				<span style="font-size: 22px;">회원가입을 하시오</span>
			${kakaodata }
			<div>
				<form id="join_form" method="post">
				
					<!-- 아이디 -->
					<div class="form-group">
						<div class="id_input_box">
							<div class="id_name" style="color: red;">Id</div>
							<input class="form-control" id="id_input" name="account_id">
						</div>
						<span class="id_input_re_1" style="display: none" > 사용 가능한 아이디입니다.</span> 
						<span class="id_input_re_2" style="display: none"> 아이디가 이미 존재합니다.</span>
						
					</div>

					<!-- 비밀번호 -->
					<div class="form-group">

						<div class="pw_input_box">
							<div class="pw_name" style="color: red;">Password</div>
							<input type="password" class="form-control" id="pw_input"
								placeholder="Password" name="account_password">
						</div>
						
					</div>

					<!-- 이름 -->
					<div class="form-group">
						<div class="user_name" style="color: red;">Name</div>
						<div class="user_input_box">
							<input class="form-control" id="user_input" placeholder="홍길동" name="account_name">
						</div>
						
					</div>

					<!-- 이메일 -->
					<div class="form-group">
						<div class="user_email" style="color: red;">Email</div>
						<div class="mail_input_box" id="mail_check_input_box_false" style="position: relative; padding-left: 89px;">
							<input class="form-control" id="mail_input" placeholder="XXX@XXX.com" name="account_email" value="">
							<div class="mail_check_button" style="display: inline;">
 								<span>인증번호 전송</span>
							</div>
						</div>
						<span class="mail_input_box_warn"></span>

						<div class="mail_check_wrap">
							<div class="mail_check_input_box" id="mail_check_input_box_false">
								<div style="color: red;">인증번호</div>
								<input class="mail_check_input" disabled="disabled">
							</div>
							<div class="clearfix"></div>
							<span id="mail_check_input_box_warn"></span>
						</div>
					</div>

					<!-- 주소 -->
					<div class="form-group">
						<div class="user_address" style="color: red;">Address</div> 
						<div class="address_input_box" style="position: relative; padding-left: 65px;">
							<input class="account_Address" id="account_Address" name="account_address" readonly="readonly">
							<div class="address_button" onclick="execution_daum_address()" style="display: inline;">
								<span>주소 찾기</span>
							</div>
						</div>
						
						<div class="clearfix"></div>
						
						<div class="address_input_2_wrap">
							<div class="address_input_2_box">
								<input class="account_address2" name="account_address2" readonly="readonly">
							</div>
						</div>
						
						<div class="address_input_3_wrap">
							<div class="address_input_3_box">
								<input class="account_address3" name="account_address3" readonly="readonly">
							</div>
						</div>
						
					</div>

					<div class="form-check">
						<div class="user_gender" style="color: red;">Gender</div> 
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" name="account_gender"
							id="optionsRadios1" value="남자" checked=""> 남자
						</label> <label class="form-check-label"> <input type="radio"
							class="form-check-input" name="account_gender"
							id="optionsRadios2" value="여자"> 여자
						</label>
					</div>

						<div class="form-group">
						<div class="user_phonenumber" style="color: red;">PhoneNumber</div> 
						<input class="form-control" id="account_phoneNumber" name="account_phoneNumber"
							 placeholder="010-xxxx-xxxx">
					</div>
					
					<div class="user_birth" style="color: red;">Birth</div>
					<input type="date" id="datepicker" name="account_birth_date">

					<div class="user_interest" style="color: red;">Interest</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="사업/창업"
							id="flexCheckDefault"> <label class="form-check-label"
							for="flexCheckDefault"> 사업/창업 </label> <input
							class="form-check-input" type="checkbox" value="IT/개발"
							id="flexCheckChecked1" name="account_interest"> <label class="form-check-label"
							for="flexCheckChecked1"> IT/개발 </label> <input
							class="form-check-input" type="checkbox" value="마케팅/홍보"
							id="flexCheckChecked2" name="account_interest"> <label class="form-check-label"
							for="flexCheckChecked2"> 마케팅/홍보 </label> <input
							class="form-check-input" type="checkbox" value="디자인/기획"
							id="flexCheckChecked3" name="account_interest"> <label class="form-check-label"
							for="flexCheckChecked3"> 디자인/기획 </label> <input
							class="form-check-input" type="checkbox" value="문화/예술"
							id="flexCheckChecked4" name="account_interest"> <label class="form-check-label"
							for="flexCheckChecked4"> 문화/예술 </label> <input
							class="form-check-input" type="checkbox" value="취미/생활"
							id="flexCheckChecked5" name="account_interest"> <label class="form-check-label"
							for="flexCheckChecked5"> 취미/생활 </label> <input
							class="form-check-input" type="checkbox" value="건강/의료"
							id="flexCheckChecked6" name="account_interest"> <label class="form-check-label"
							for="flexCheckChecked6"> 건강/의료 </label>
					</div>
					
					<div>
						<button type="button" class="btn btn-primary disabled"
							id="join_button" style="width: 150px;">회원가입</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>

	<script type="text/javascript">
		var code = "";
		var idCheck = false;
		var idckCheck = false;
		var pwCheck = false;
		var nameCheck = false;
		var mailCheck = false;
		var mailNumCheck = false;
		var addressCheck = false;
		var phonenumberCheck = false;
		
		
		
		
		$(document).ready(function() {
			//회원가입 버튼(회원가입 기능 작동)
			$("#join_button").click(function() {
 				$("#join_form").attr("action", "/login/join");
 				$("#join_form").submit();
			
			});
		});

		//아이디 중복 검사
		$('#id_input').on(
				"propertychange change keyup paste input",
				function() {

					var account_id = $('#id_input').val();
					var data = {
						account_id : account_id
					}

					$.ajax({
						type : "post",
						url : "/login/accountIdChk",
						data : data,
						success : function(result) {
							//console.log("성공 여부" + result);
							if (result != 'fail') {
								$('.id_input_re_1').css("display",
										"inline-block");
								$('.id_input_re_2').css("display", "none");								
							} else {
								$('.id_input_re_2').css("display",
										"inline-block");
								$('.id_input_re_1').css("display", "none");								
							}

						}
					});

				});

		//인증번호 이메일 전송 
		$(".mail_check_button").click(function() {
			var email = $("#mail_input").val();
			var cehckBox = $(".mail_check_input"); // 인증번호 입력란
			var boxWrap = $("#mail_check_input_box"); // 인증번호 입력란 박스
			var warnMsg = $(".mail_input_box_warn");
			
			/* 이메일 형식 유효성 검사 */
		    if(mailFormCheck(email)){
		        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
		        warnMsg.css("display", "inline-block");
		    } else {
		        warnMsg.html("올바르지 못한 이메일 형식입니다.");
		        warnMsg.css("display", "inline-block");
		        return false;
		    }    
			
			$.ajax({

				type : "GET",
				url : "mailCheck?email=" + email,
				success : function(data) {

					cehckBox.attr("disabled", false);
					boxWrap.attr("id", "mail_check_input_box_true");
					code = data;
				}
			});
		});

		//인증번호 비교 
		$(".mail_check_input").blur(function() {
			var inputCode = $(".mail_check_input").val(); // 입력코드    
			var checkResult = $("#mail_check_input_box_warn"); // 비교 결과

			if (inputCode == code) { // 일치할 경우
				checkResult.html("넌 MoHang 회원이 될 자격이 있다. ");
				checkResult.attr("class", "correct");
			} else { // 일치하지 않을 경우
				checkResult.html("넌 MoHang 회원이 될 자격이 없다.");
				checkResult.attr("class", "incorrect");
			}
		});

		//다음 주소 연동 
		function execution_daum_address() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								addr += extraAddr;

							} else {
								addr += ' ';
							}

							$("[name=account_address]").val(data.zonecode);
							$("[name=account_address2]").val(addr);

							// 커서를 상세주소 필드로 이동한다.
							$(".account_address3").attr("readonly", false);
							$(".account_address3").focus();

						}
					}).open();
			
		}
		
		 //이메일 형식 유효성 검사 
		function mailFormCheck(email) {
			var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			return form.test(email);
		}
	</script>

	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
		//네이버
		var naver_id_login = new naver_id_login("MDRiA49_85RjXmufA7A9", "http://localhost:8081/login/join");
		
		var email = (naver_id_login.getProfileData('email'));
		var name = (naver_id_login.getProfileData('name'));
		
		  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		  function naverSignInCallback() {
		    console.log(naver_id_login.getProfileData('email'));
		    console.log(naver_id_login.getProfileData('name'));
		    console.log(naver_id_login.getProfileData('gender'));
		    console.log(naver_id_login.getProfileData('birthday'));
		    
		    var email = (naver_id_login.getProfileData('email'));
		    var name = (naver_id_login.getProfileData('name'));
		    
		    $('input[name = account_email]').attr('value', email);
		    $('input[name = account_name]').attr('value', name);
		  }
		  naver_id_login.get_naver_userprofile("naverSignInCallback()");
		
	</script>
	



</body>
</html>

















