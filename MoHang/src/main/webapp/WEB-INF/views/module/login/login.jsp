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
    
    <script>

    /* 페이스북 */
//   //기존 로그인 상태를 가져오기 위해 Facebook에 대한 호출
//   function statusChangeCallback(res){
//   	statusChangeCallback(response);
//   }

//   function fnFbCustomLogin(){
//   	FB.login(function(response) {
//   		if (response.status === 'connected') {
//   			FB.api('/me', 'get', {fields: 'name,email'}, function(r) {
//   				console.log(r);
//   			})
//   		} else if (response.status === 'not_authorized') {
//   			// 사람은 Facebook에 로그인했지만 앱에는 로그인하지 않았습니다.
//   			alert('앱에 로그인해야 이용가능한 기능입니다.');
//   		} else {
//   			// 그 사람은 Facebook에 로그인하지 않았으므로이 앱에 로그인했는지 여부는 확실하지 않습니다.
//   			alert('페이스북에 로그인해야 이용가능한 기능입니다.');
//   		}
//   	}, {scope: 'public_profile,email'});
//   }

//   window.fbAsyncInit = function() {
//   	FB.init({
//   		appId      : '1588150011384568', // 내 앱 ID를 입력한다.
//   		cookie     : true,
//   		xfbml      : true,
//   		version    : 'v10.0'
//   	});
//   	FB.AppEvents.logPageView();   
//   };


	 </script>
	 
<!-- 	 <!-- 네이버 스크립트 --> -->
<!-- <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script> -->

<script>

// var naverLogin = new naver.LoginWithNaverId(
// 		{
// 			clientId: "80mdf88flkWWJT1f93Tz", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
// 			callbackUrl: "http://localhost:8181/naverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
// 			isPopup: false,
// 			callbackHandle: true
// 		}
// 	);	

// naverLogin.init();

// window.addEventListener('load', function () {
// 	naverLogin.getLoginStatus(function (status) {
// 		if (status) {
// 			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
// 			console.log(naverLogin.user); 
    		
//             if( email == undefined || email == null) {
// 				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
// 				naverLogin.reprompt();
// 				return;
// 			}
// 		} else {
// 			console.log("callback 처리에 실패하였습니다.");
// 		}
// 	});
// });


// var testPopUp;
// function openPopUp() {
//     testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
// }
// function closePopUp(){
//     testPopUp.close();
// }

// function naverLogout() {
// 	openPopUp();
// 	setTimeout(function() {
// 		closePopUp();
// 		}, 1000);
	
	
// }
<!-- </script> -->
	 
<!-- 	 function init() { -->
<!-- 	gapi.load('auth2', function() { -->
<!-- 		gapi.auth2.init(); -->
<!-- 		options = new gapi.auth2.SigninOptionsBuilder(); -->
<!-- 		options.setPrompt('select_account'); -->
<!--         // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가 -->
<!-- 		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read'); -->
<!--         // 인스턴스의 함수 호출 - element에 로그인 기능 추가 -->
<!--         // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들 -->
<!-- 		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure); -->
<!-- 	}) -->
<!-- } -->

<!-- function onSignIn(googleUser) { -->
<!-- 	var access_token = googleUser.getAuthResponse().access_token -->
<!-- 	$.ajax({ -->
<!--     	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다. -->
<!-- 		url: 'https://people.googleapis.com/v1/people/me' -->
<!--         // key에 자신의 API 키를 넣습니다. -->
<!-- 		, data: {personFields:'birthdays', key:'AIzaSyBOdmeC4SOSzXmPGLEM2vZueqiBSWKg3wk', 'access_token': access_token} -->
<!-- 		, method:'GET' -->
<!-- 	}) -->
<!-- 	.done(function(e){ -->
<!--         //프로필을 가져온다. -->
<!-- 		var profile = googleUser.getBasicProfile(); -->
<!-- 		console.log(profile) -->
<!-- 	}) -->
<!-- 	.fail(function(e){ -->
<!-- 		console.log(e); -->
<!-- 	}) -->
<!-- } -->
	 
    <script>
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








