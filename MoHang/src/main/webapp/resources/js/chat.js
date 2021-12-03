//chat event

var chatService = (function() {
	//채팅창 스크롤바 이벤트
	function scrollbar_event() {
		var history_div = $(".chat-history");
		var height = 400;

		history_div.height(height).css("overflow", "auto");

		scrollBottom = history_div.scrollTop() + height;
		history_div.animate({ scrollTop: history_div[0].scrollHeight }, 400);
	}

	function timeEvent() {
		var date = new Date();

		var timeData = {
			timeDivision:"",
			month : date.getMonth() -1,
			day : date.getDate(),
			hour : date.getHours(),
			minute : date.getMinutes()
		}
		
		if (timeData.hour < 12){
			timeData.timeDivision = "am";
		}else {
			timeData.hour -= 12;
			timeData.timeDivision = "pm";
		}
		
		return timeData;
	}

	//서버에 메세지 전송하는 메서드
	function input(socket) {
		//enter key event
		$(".form-control").keydown(function(event) {
			if (event.keyCode == 13 && $(this).val() != "") {
				var message = "<div class=\"message my-message\">" + $(this).val() + "</div>";
				var date = timeEvent();
				var day = 1;
				var moth = 12;

				// 채팅 시간별로 나눠주기 위한 조건 
				if (month == date.month && day == date.day) {
					time = "<div class=\"message-data\"><span class=\"message-data-time\">" + date.hour + ":" + date.minute + ", " + "today" + "</span></div>";
				} else if (month == date.month && day > date.day) {
					time = "<div class=\"message-data\"><span class=\"message-data-time\">" + date.hour+ ":" + date.minute + ", " + (day - date.day) + "일 전 </span></div>";
				} else {
					time = "<div class=\"message-data\"><span class=\"message-data-time\">" + date.hour + ":" + date.minute + ", " + (month - date.month) + "달 전 </span></div>";
				}
				var li = "<li class=\"clearfix\">" + time + message + "</li>";

				// 채팅 내용 추가 
				$("ul.m-b-0").append(li);

				socket.emit('msg', $(this).val());

				scrollbar_event();
				// 빈창 확
				$(this).val("");
			}
		});
	}

	//서버에서 메세지를 받아오는 메서드
	function message(socket) {
		socket.on('msg', function(msg) {
			var date = timeEvent();
			
			var message = "<div class=\"message other-message float-right\">" + msg + "</div>";
			var data_div = '<div class="message-data text-right"><span class="message-data-time">' + date.hour + ':' + date.minute +' ' + date.timeDivision + ', Today</span> <img src="../resources/assets/img/portfolio/person.png" alt="avatar"></div>';

			var li = "<li class=\"clearfix\">" + data_div + message + "</li>";
			console.log(msg);
			$("ul.m-b-0").append(li);
			scrollbar_event();

		})
	}

	// 유저를 불러오는 메서드
	function userlist(callback, error) {

		$.getJSON("/chat/list.json", function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}


	// 채팅 내역 불러오는 메서드
	function chatlist(callback, error){
		$.getJSON("/chat/list/"+room_num+".json",function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
		
	}

	return {
		input: input,
		userlist: userlist,
		message: message
	};
})();



