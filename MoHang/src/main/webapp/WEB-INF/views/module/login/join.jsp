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
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="container-box">
		<div id="container">
			<div>
				<a href="/Main"> <img src="../resources/images/로고.png"
					style="margin-left: 800px;"></a>
			</div>

			<div class="form-group"
				style="line-height: 40px; text-align: center;">
				<label class="form-label mt-4">회원가입을 하시오</label>

				<section id="box">
					<form action="/module/login/join" method="post">
						<div class="form-group">
							<label for="accountId" class="form-label mt-4"
								style="color: red;">Id</label> <input type="email"
								class="form-control" id="accountId" aria-describedby="emailHelp"
								placeholder="name@example.com" name="accountId">
						</div>

						<div class="form-group">
							<label for="accountPassword" class="form-label mt-4"
								style="color: red;">Password</label> <input type="password"
								class="form-control" id="accountPassword" placeholder="Password"
								name="accountPassword">
						</div>

						<div class="form-group">
							<label for="accountName" class="form-label mt-4"
								style="color: red;">Name</label> <input type="password"
								class="form-control" id="accountName" placeholder="홍길동"
								name="accountName">
						</div>
					</form>
				</section>
				<div class="form-check">
					<label for="exampleInputEmail1" class="form-label mt-4"
						style="color: red;">성별</label> <label class="form-check-label">
						<input type="radio" class="form-check-input" name="optionsRadios"
						id="optionsRadios1" value="option1" checked=""> 남자
					</label> <label class="form-check-label"> <input type="radio"
						class="form-check-input" name="optionsRadios" id="optionsRadios2"
						value="option2"> 여자
					</label>
				</div>

				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4"
						style="color: red;">출생년도</label> <select class="form-select"
						id="exampleSelect1">
						<option>1987</option>
						<option>1988</option>
						<option>1989</option>
						<option>1990</option>
						<option>1991</option>
						<option>1992</option>
						<option>1993</option>
						<option>1994</option>
						<option>1995</option>
						<option>1996</option>
						<option>1997</option>
					</select>
				</div>

				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4"
						style="color: red;">전화번호</label> <input type="email"
						class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="010-xxxx-xxxx">
				</div>

				<label for="exampleInputEmail1" class="form-label mt-4"
					style="color: red;">관심사</label>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value=""
						id="flexCheckDefault"> <label class="form-check-label"
						for="flexCheckDefault"> 사업/창업 </label> <input
						class="form-check-input" type="checkbox" value=""
						id="flexCheckChecked1"> <label class="form-check-label"
						for="flexCheckChecked1"> IT/개발 </label> <input
						class="form-check-input" type="checkbox" value=""
						id="flexCheckChecked2"> <label class="form-check-label"
						for="flexCheckChecked2"> 마케팅/홍보 </label> <input
						class="form-check-input" type="checkbox" value=""
						id="flexCheckChecked3"> <label class="form-check-label"
						for="flexCheckChecked3"> 디자인/기획 </label> <input
						class="form-check-input" type="checkbox" value=""
						id="flexCheckChecked4"> <label class="form-check-label"
						for="flexCheckChecked4"> 문화/예술 </label> <input
						class="form-check-input" type="checkbox" value=""
						id="flexCheckChecked5"> <label class="form-check-label"
						for="flexCheckChecked5"> 취미/생활 </label> <input
						class="form-check-input" type="checkbox" value=""
						id="flexCheckChecked6"> <label class="form-check-label"
						for="flexCheckChecked6"> 건강/의료 </label>
				</div>

				<div>
					<button type="button" onclick="location.href='/login/login'"
						class="btn btn-primary disabled" id="join_button"
						style="width: 150px;">회원가입</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			//회원가입 버튼(회원가입 기능 작동)
			$(".join_button").click(function() {
				$("#join_form").attr("action", "/join/join");
				$("#join_form").submit();
			});
		});
	</script>
</body>
</html>

















