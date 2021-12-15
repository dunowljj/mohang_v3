//chat event

var chatService = (function() {
	//채팅창 스크롤바 이벤트
	function scrollbar_event() {
		var history_div = $(".chat-history");
		//var ul_chatlist = $("ul.chat-list");
		var height = 400;

		history_div.height(height).css("overflow", "auto");
		//ul_chatlist.height(height).css("overflow", "auto");
		
		
		scrollBottom = history_div.scrollTop() + height;
		//scrollBottom = ul_chatlist.scrollTop() + height;
		
		history_div.animate({ scrollTop: history_div[0].scrollHeight }, 400);
		//ul_chatlist.animate({ scrollTop: history_div[0].scrollHeight }, 400);
	}

	function timeEvent() {
		var date = new Date();

		var timeData = {
			timeDivision: "",
			month: date.getMonth() - 1,
			day: date.getDate(),
			hour: date.getHours(),
			minute: date.getMinutes()
		}

		if (timeData.hour < 12) {
			timeData.timeDivision = "am";
		} else {
			timeData.hour -= 12;
			timeData.timeDivision = "pm";
		}

		return timeData;
	}

	//서버에 메세지 전송하는 메서드
	function input(chat, callback, error) {
		$.ajax({
			type: 'post',
			url : '/chat/new',
			data : JSON.stringify(chat),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	}

	//서버에서 메세지를 받아오는 메서드
	function message(socket) {
		socket.on('msg', function(msg) {
			var date = timeEvent();

			var message = "<div class=\"message other-message float-right\">" + msg + "</div>";
			var data_div = '<div class="message-data text-right"><span class="message-data-time">' + date.hour + ':' + date.minute + ' ' + date.timeDivision + ', Today</span> <img src="../resources/assets/img/portfolio/person.png" alt="avatar"></div>';

			var li = "<li class=\"clearfix\">" + data_div + message + "</li>";
			console.log(msg);
			$("ul.m-b-0").append(li);
			scrollbar_event();
		});
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
	function chatlist(room_num, callback, error) {
		$.getJSON("/chat/list/" + room_num + ".json", function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});

	}


	function deleteChat(room_num, callback, error){
		$.ajax({
			type: 'post',
			url: '/chat/' + room_num,
			success: function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
				
			},
			error: function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	}

	return {
		input: input,
		userlist: userlist,
		message: message,
		chatlist: chatlist,
		timeEvent: timeEvent,
		deleteChat : deleteChat
	};
})();



