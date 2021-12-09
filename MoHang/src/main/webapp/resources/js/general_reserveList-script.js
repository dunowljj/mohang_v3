function attendEvent(resNum){
	console.log(resNum);
	var form = document.getElementById(""+resNum+"");
//	var attendForm = document.forms[""+resNum+""];
	
	var answer = confirm("행사에 참여합니다.")
	if(answer==true){
		alert("출석체크 되었습니다.")
		form.submit();
	}
}
function cancelConfirm(){
	var answer = confirm("정말 예약을 취소하시겠습니까?")
	if(answer==false){
		return false;
	}
	alert("예약이 취소되었습니다. 즉시 환불처리 됩니다.")
}