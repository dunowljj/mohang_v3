<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			
			var accountData = $("#accountData");
			var account_num = accountData.find("input[name='account_num']").val();
			var room_num_temp=''; // 방번호 전역으로 쉽게쓰고싶어서...
			
			// 서버와의 소켓연결 
			var socket = io("http://localhost:1577");
			
			// 접속자 소켓에 추가
			socket.emit('addUser', account_num);
			
			//채팅 목록 갱신..
			chatUserList();
			
			//setInterval(chatUserList, 10000);
			
			
			//대화 상대 불러오는 메서드
			function chatUserList(){
				console.log("불러옴");
				chatService.userlist(function(list){
					var ul_chatlist = $("ul.chat-list");
					ul_chatlist.children().remove();
					var height = 400;

					ul_chatlist.height(height).css("overflow", "auto");
					var scrollBottom = ul_chatlist.scrollTop() + height;
					
					
					var login="";
					if (list == null || list.length == 0) {
						return;
					}

					for (var i = 0, len = list.length || 0; i < len; i++) {
						console.log(list[i].account_name);
							if(list[i].account_login == '0'){
								login = '<i class="fa fa-circle offline">'
							}else{
								login= '<i class="fa fa-circle online">'
							}
							console.log(list[i].account_login);
							console.log(login);
							var img = '<img src="../resources/assets/img/portfolio/person.png" alt="avatar">';
							var about = '<div class="about"><div class="name">' + list[i].account_name + '</div><div class="status">'+login+'</i>10분 전</div></div>'
							var li = '<li class="clearfix" data-room_num="'+list[i].room_num+'" data-opponent_num="'+list[i].account_num+'" data-opponent_name="'+list[i].account_name+'">' + img + about + '</li>';

							$("ul.chat-list").append(li);			
					}	
				});
			}
			
				// 채팅내역 출력
				chatShowList();
				// 메세지 전송하는 메서드
				
				var history_div = $(".chat-history");
				//var ul_chatlist = $("ul.chat-list");
				var height = 400;

				history_div.height(height).css("overflow", "auto");
				//ul_chatlist.height(height).css("overflow", "auto");
				
				
				scrollBottom = history_div.scrollTop() + height;
				
				//enter key event
				$(".form-control").keydown(function(event) {
					if (event.keyCode == 13 && $(this).val() != "" && room_num_temp !='') {
						var msg = $(this).val();
						var message = "<div class=\"message my-message\">" + $(this).val() + "</div>";
						var day = 1;
						var moth = 12;
						var date = chatService.timeEvent();
						// 채팅 시간별로 나눠주기 위한 조건 
						if (month == date.month && day == date.day) {
							time = "<div class=\"message-data\"><span class=\"message-data-time\">" + date.hour + ":" + date.minute + ", " + "today" + "</span></div>";
						} else if (month == date.month && day > date.day) {
							time = "<div class=\"message-data\"><span class=\"message-data-time\">" + date.hour + ":" + date.minute + ", " + (day - date.day) + "일 전 </span></div>";
						} else {
							time = "<div class=\"message-data\"><span class=\"message-data-time\">" + date.hour + ":" + date.minute + ", " + (month - date.month) + "달 전 </span></div>";
						}
						var li = "<li class=\"clearfix\">" + time + message + "</li>";

						// 채팅 내용 추가 
						$("ul.m-b-0").append(li);

						socket.emit('msg', $(this).val());
						
						history_div.animate({ scrollTop: history_div[0].scrollHeight }, 400);

						// 빈창 확
						$(this).val("");
						
						var chat = {
								room_num: room_num_temp,
								account_num : account_num,
								admin_num : "0",
								chat_history: msg
						}
						
						chatService.input(chat,function(result){
							console.log(result);
						});
						
						// 채팅 내역 재출력
						chatShowList();	
					}
				});
				
				//서버에서 메세지를 받아오는 메서드
				chatService.message(socket);
		
			function chatShowList(){
				console.log("123")
				$(".people-list .chat-list").on('click','li', function(e){
					
					e.preventDefault();
					$(".people-list .chat-list").children().addClass('clearfix');
					
					$(this).addClass('clearfix active');
					
					$("ul.m-b-0").children().remove();
					
					//클릭한 방번호값 가져오기
					var room_num = $(this).data("room_num");
					room_num_temp = room_num;
					//클릭한 상대유저 아이디 인덱스 가져오기
					var opponent_num = $(this).data("opponent_num");
					var opponent_name = $(this).data("opponent_name");
					
					
					//채팅서버에 접속중인지 소켓을 체크하기 위해 상대 유저 번호를 넘겨줌
					socket.emit("selectUser", opponent_num);
					
					var selectUserInfo = '<h6 class="m-b-0">'+opponent_name+'</h6>';
					var lastMessageTime ;
					
					chatService.chatlist(room_num,function(list){
						if(list == null || list == 0){
							return;
						}	
						for(var i = 0, len = list.length || 0; i < len ; i++){
							var date = chatService.timeEvent();
							if(list[i].account_num == account_num){
								var message = "<div class=\"message my-message\">" + list[i].chat_history + "</div>";
								var day = 1;
								var moth = 12;
								// 채팅 시간별로 나눠주기 위한 조건 
								if (month == date.month && day == date.day) {
									time = "<div class=\"message-data\"><span class=\"message-data-time\">" + date.hour + ":" + date.minute + ", " + "today" + "</span></div>";
								} else if (month == date.month && day > date.day) {
									time = "<div class=\"message-data\"><span class=\"message-data-time\">" + date.hour + ":" + date.minute + ", " + (day - date.day) + "일 전 </span></div>";
								} else {
									time = "<div class=\"message-data\"><span class=\"message-data-time\">" + date.hour + ":" + date.minute + ", " + (month - date.month) + "달 전 </span></div>";							}
								var li = "<li class=\"clearfix\">" + time + message + "</li>";
		
								// 채팅 내용 추가 
								$("ul.m-b-0").append(li);	
								}else{

								var message = "<div class=\"message other-message float-right\">" + list[i].chat_history + "</div>";
								var data_div = '<div class="message-data text-right"><span class="message-data-time">' + date.hour + ':' + date.minute + ' ' + date.timeDivision + ', Today</span> <img src="../resources/assets/img/portfolio/person.png" alt="avatar"></div>';

								var li = "<li class=\"clearfix\">" + data_div + message + "</li>";
								$("ul.m-b-0").append(li);
							}
							
								console.log(list[i].chat_date);
							
						}
					
				});
					
			});		
			}
			
		
		$("#chat_exit").on('click', function(e){
			e.preventDefault();
			
			chatService.deleteChat(room_num_temp);
			
			chatUserList();
			console.log("chatUserList()");
		});
	});
	</script>
	<form id="accountData" action="/chat/list" method="get">
		<input type="hidden" name="account_num" value="${account_num }">
	</form>
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
										id="chat_exit" class="btn btn-outline-warning" style="color:red; border-color:red;"><i class="fa fa-times-circle" style="color:red"></i></a>
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