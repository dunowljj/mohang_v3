function goReview(resNum){
	console.log(resNum);
	var form = document.getElementById(""+resNum+"");
//	var attendForm = document.forms[""+resNum+""];
	form.submit();
}
//function cancelConfirm(){
//	var answer = confirm("정말 예약을 취소하시겠습니까?")
//	if(answer==false){
//		return false;
//	}
//	alert("예약이 취소되었습니다. 환불처리는 승인 후 진행됩니다.")
//}