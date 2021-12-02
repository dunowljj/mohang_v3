<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<style> *{font-family: 'Jua', sans-serif;} </style>
<!-- 인코딩 -->
<!-- css적용 -->
<!-- <link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="../resources/css/bootstrap.css" rel="stylesheet" /> -->
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
</head>
<body>
	<div id="container-box1">
		<div id="container">
			<form id="login_form" method="post">
				<div>
					<a href="/Main"> <img src="../resources/images/로고.png"
						style="margin-left: 800px;"></a>
				</div>
				<div class="form-group" style="text-align: center; line-height: 50px;">
					<label class="form-label mt-4">로그인을 하시오</label>

					<div class="form-floating mb-3">
						<input type="email" class="form-control" id="id_input"
							placeholder="name@example.com" style="width: 300px; height: 30px;" name="account_id"> 
							<label for="floatingInput"></label>
					</div>

					<div class="form-floating">
						<input type="password" class="form-control" id="pw_input"
							placeholder="Password" style="width: 300px; height: 30px;" name="account_password">
						<label for="floatingPassword"></label>
					</div>

					<c:if test="${result == 0 }">
						<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
					</c:if>

					<button type="button" class="login_button" style="width: 150px;">로그인</button>
					
			</form>
			
			<div>
				<button type="button" class="btn btn-warning"
					onclick="location.href='javascript:kakaoLogin();'"
					style="width: 150px; background-color: yellow;">카카오톡으로 로그인</button>
			</div>
			<a href="javascript:kakaoLogout();">로그아웃</a> <a
				href="javascript:secession();">탈퇴</a>
		</div>
	</div>
	</div>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	window.Kakao.init('992f2a7db7df2ab854e56a375167df17');
	console.log(Kakao.isInitialized());

	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
        
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  
    
    function secession() {
    	Kakao.API.request({
        	url: '/v1/user/unlink',
        	success: function(response) {
        		console.log(response);
        		//callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
        		window.location.href='/Main'
        	},
        	fail: function(error) {
        		console.log('탈퇴 미완료')
        		console.log(error);
        	},
    	});
    };
    
    //로그인 버튼 클릭 메서드 
    $(".login_button").click(function(){
        
        /* alert("로그인 버튼 작동"); */
        
        /* 로그인 메서드 서버 요청 */
    	$("#login_form").attr("action", "/login/login");
        $("#login_form").submit();
           
    });
    </script>
</body>
</html>








