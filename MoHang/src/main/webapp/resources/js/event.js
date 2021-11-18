$(document).ready(function(){

        $("#applyList tr:odd").addClass("odd");
        $("#applyList tr:not(.odd)").hide(); 
        $("#applyList tr:first-child").show(); //열머리글 보여주기

        $("#applyList tr.odd").click(function(){
            $(this).next("tr").toggle();
            $(this).find(".arrow").toggleClass("up");

        });
});
   

	//특정시간에 사진 전환
	var today = new Date();
	var nowYear = today.getFullYear();
	var nowMonth = today.getMonth()+1;
	var nowDate = today.getDate();
	
	function plusZero(time){
		var time = time.toString();
		if(time.length<2){
			time='0'+time;
			return time;
		}else{
			return time;
		}
	}
	
	nowYear = plusZero(nowYear);
	nowMonth = plusZero(nowMonth);
	nowDate = plusZero(nowDate);

	
	var nowDate = nowYear+nowMonth+nowDate;
	nowDate = Number(nowDate);
	console.log(nowDate);
	//db에 저장되어있는 시간 불러와서 연/월/일로 쪼개서 위와같은 과정으로 가져오기. 
	//일단은 임의로 지정하겠음. 
	var startDate = 2021103;
	var endDate = 2021130;

	
	$(function(){
		$('.arccodianBox figure:nth-child(1)').css('opacity',1.0);
		//조건 만족시 투명도 조절 Approve.AP_Check. 날짜관련 이미지는 결제조건(Event_Hall_Payment.EH_Payment_Status)도 만족해야함. 
		//지금은 임의로 날짜만 지정하겠음. 
		if(nowDate <startDate){
			$('.arccodianBox figure:nth-child(5)').css('opacity',1.0);
			console.log(nowDate);
		} else if(startDate<=nowDate && nowDate<endDate ){
			$('.arccodianBox figure:nth-child(6)').css('opacity',1.0);
			console.log(nowDate);
		} else if(endDate<nowDate){
			$('.arccodianBox figure:nth-child(7)').css('opacity',1.0);
			console.log(nowDate);
		}
	});
	
	
