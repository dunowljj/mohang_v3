//chat event 
$(document).ready(function(){

	
	//채팅창 스크롤바 이벤트
	var history_div = $(".chat-history");
	var height = history_div.height();
	
	history_div.height(height).css("overflow","auto");
	
	scrollBottom = history_div.scrollTop() + height;
	
	

	//enter key event
	$(".form-control").keydown(function(event){
		if(event.keyCode == 13 && $(this).val() != ""){
			var date = new Date();
			var message = "<div class=\"message my-message\">"+$(this).val()+"</div>";
			var month = 10 -1;
			var day = 26;
			var time;
			
			console.log(day +"," + date.getDate());
			// 채팅 시간별로 나눠주기 위한 조건 
			if(month == date.getMonth() && day == date.getDate()){
				time = "<div class=\"message-data\"><span class=\"message-data-time\">" + date.getHours() +":"+date.getMinutes()+", " + "today" +"</span></div>";
			}else if(month == date.getMonth() && day > date.getDate()){
				time = "<div class=\"message-data\"><span class=\"message-data-time\">" + date.getHours() +":"+date.getMinutes()+", " + (day - date.getDate()) +"일 전 </span></div>";
			}else{
				time = "<div class=\"message-data\"><span class=\"message-data-time\">" + date.getHours() +":"+date.getMinutes()+", " + (month - date.getMonth()) +"달 전 </span></div>";
			}
			var li = "<li class=\"clearfix\">"+time + message+"</li>";
			
			// 채팅 내용 추가 
			$("ul.m-b-0").append(li);
			
			
			history_div.scrollTop(scrollBottom);
			// 빈창 확
			$(this).val("");
		}
	});	
	
	
	// 대화 상대 클릭 이벤트
	$(".list-unstyled chat-list mt-2 mb-0 < li").on("mousedown",function(){
		console.log("clearfix click123");
		$(".clearfix active").addClass("clearfix");
		$(this).addClass("clearfix active");
	});	
});


var chatService = (function (){
	
});