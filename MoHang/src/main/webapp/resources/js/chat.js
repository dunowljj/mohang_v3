//chat event 
$(document).ready(function(){

	//enter key event
	$(".form-control").keydown(function(event){
		if(event.keyCode == 13){
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
			var li = "<li class=\"clearfix\"></li>";
			
			// 채팅 내용을 자식노드로 추
			$("ul.m-b-0").append(li);
			$("ul.m-b-0").last().append(time);
			$("ul.m-b-0").last().append(message);
			
			// 빈창 확
			$(this).val("");
		}
	});	
});
