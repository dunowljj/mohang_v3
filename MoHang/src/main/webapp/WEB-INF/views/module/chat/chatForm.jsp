<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/resources/css/chat.css?ver=<%System.currentTimeMillis();%>"
	rel="stylesheet" type="text/css" />
<script src="http://localhost:1577/socket.io/socket.io.js"></script>
<script src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/chat.js"></script>
<title>Insert title here</title>
</head>
<jsp:include page="/WEB-INF/views/comm/header.jsp" />
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			
			// 서버와의 소켓연결 
			var socket = io("http://localhost:1577");
			
			// 메세지 전송하는 메서드
			chatService.input(socket);
			
			//대화 목록 불러오는 메서드
			chatService.userlist(function(list){
				socket.on('user', function(user){
				if (list == null || list.length == 0) {
					return;
				}

				for (var i = 0, len = list.length || 0; i < len; i++) {
					
					console.log(list[i].account_name);
				
						var img = '<img src="../resources/assets/img/portfolio/person.png" alt="avatar">';
						var about = '<div class="about"><div class="name">' + list[i].account_name + '</div><div class="status"><i class="fa fa-circle online"></i>10분 전</div></div>'
						var li = '<li class="clearfix active">' + img + about + '</li>';


						$("ul.chat-list").append(li);
						console.log(li);
						console.log(user);
						console.log('test154');
					

				}
				});
			});
			
		/*	chatService.chatlist(function(list){
				socket.on('user', function(user){
					if(list == null || list == 0){
						return;
					}
					
					for(var i = 0, len = list.length || 0; i < len ; i++){
						
						
					}
				});
			})
		*/
			//메세지 불러오는 메서드
			chatService.message(socket);
			
			
		});
	</script>
	<div class="container" id="chat-container">
		<div class="row clearfix">
			<div class="col-lg-12">
				<div class="card chat-app">
					<div id="plist" class="people-list">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fa fa-search"></i></span>
							</div>
							<input type="text" class="form-seach" placeholder="Search...">
						</div>
						<ul class="list-unstyled chat-list mt-2 mb-0">
						</ul> <!-- end people-list -->
					</div>
					<div class="chat">
						<div class="chat-header clearfix">
							<div class="row">
								<div class="col-lg-6">
									<a href="javascript:void(0);" data-toggle="modal"
										data-target="#view_info"> <img
										src="${pageContext.request.contextPath}/resources/assets/img/portfolio/person.png"
										alt="avatar">
									</a>
									<div class="chat-about">
										<h6 class="m-b-0">최지혜</h6>
										<small>10분 전</small>
									</div>
								</div>
								<div class="col-lg-6 hidden-sm text-right">
									<a href="javascript:void(0);" class="btn btn-outline-secondary"><i
										class="fa fa-camera"></i></a> <a href="javascript:void(0);"
										class="btn btn-outline-primary"><i class="fa fa-image"></i></a>
									<a href="javascript:void(0);" class="btn btn-outline-info"><i
										class="fa fa-cogs"></i></a> <a href="javascript:void(0);"
										class="btn btn-outline-warning"><i class="fa fa-question"></i></a>
								</div>
							</div>
						</div>
						<div class="chat-history">
							<ul class="m-b-0">
								<!-- 메세지들 입력하는 곳 -->
							</ul>
						</div>
						<div class="chat-message clearfix">
							<div class="input-group mb-0">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fa fa-send"></i></span>
								</div>
								<input type="text" class="form-control"
									placeholder="메세지 입력후 enter키를 입력해주세요.">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</html>