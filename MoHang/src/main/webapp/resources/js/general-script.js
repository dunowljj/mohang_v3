//수량 더하기 빼기


function count(type)  {
	const ticketNumberElement = document.getElementById('ticketCount');
	const ticketPriceElement = document.getElementById('ticketPrice');
	const ticketTotalElement = document.getElementById('ticketTotal');
	const m_ticketNumberElement = document.getElementById('m_ticketCount');
	const m_ticketTotalElement = document.getElementById('m_ticketTotal');

	
  let ticketNumber = ticketNumberElement.innerText;
  let ticketPrice = ticketPriceElement.innerText;
  let ticketTotal = ticketPriceElement.innerText;
  
  console.log(remainTicket);
  console.log(ticketNumber);
  
  
  remainTicketI = parseInt(remainTicket);
  console.log(remainTicketI);
  
 
   if(type === 'plus' && ticketNumber < remainTicketI) {
	  ticketNumber = parseInt(ticketNumber) + 1;
  }
  else if(type === 'minus'&& ticketNumber != 1)  {
	  ticketNumber = parseInt(ticketNumber) - 1;
  }
  else if(ticketNumber >= remainTicketI){
	   alert("남은 티켓이 없습니다!");
   }

  var totalPrice = parseInt(ticketPrice)*parseInt(ticketNumber);
//  console.log(totalPrice);
  ticketNumberElement.innerText = ticketNumber;
  ticketTotalElement.innerText = totalPrice;
  
  
  m_ticketNumberElement.innerText = ticketNumber;
  m_ticketTotalElement.innerText = totalPrice;
//	  parseInt(ticketPrice)*parseInt(ticketNumber);
  
  document.getElementById("ticket_reservation_amount").value = parseInt(ticketNumber);
  document.getElementById("ticket_payment_price").value = parseInt(totalPrice);
  
}
var recruiteConstraint = "<c:out value='${event.e_recruitepeople}'/>"
//잔여표계산해서 제약 걸기



//티켓 총 가격 전달
function pushTicketTotal(){
	document.getElementById("ticket_payment_price").value = document.getElementsByName('e_price')[0].value;
}

//submit 시간 전달
function pushPayTime(){
	document.getElementById("ticket_payment_time").value=getTodayAndTime('-',':',true);
}

//reserve페이지 진입 시점 날짜와 시간 전달 
function pushReserveTime(){
	document.getElementById("ticket_reservation_time").value=getTodayAndTime('-',':',true);
}


//날짜에다가  시간 선택해서 받기
function getTodayAndTime(seperator1, seperator2, isContainTime){
	let today = new Date()
	var year = today.getFullYear();
	var month = today.getMonth(); 
	var date = today.getDate();
	var hours = today.getHours(); 
	var minutes = today.getMinutes();
	var seconds = today.getSeconds(); 
	
	if(isContainTime){
		var thisDateAndTime = (`${year}${seperator1}${month >= 10 ? month : '0' + month}${seperator1}${date >= 10 ? date : '0' + date},${hours >= 10 ? hours : '0' + hours}${seperator2}${minutes >= 10 ? minutes : '0' + minutes}${seperator2}${seconds >= 10 ? seconds : '0' + seconds}`)
		return thisDateAndTime;
	} else{
		return getToday(seperator1);
	}
}
//현재 날짜 받기
function getToday(seperator){
	let today = new Date()
	var year = today.getFullYear();
	var month = today.getMonth(); 
	var date = today.getDate();
	
	var thisDate = (`${year}${seperator}${month >= 10 ? month : '0' + month}${seperator}${date >= 10 ? date : '0' + date}`);
	return thisDate;
}
//현재 시간 받기
function getTime(seperator){
	let todayTime = new Date()
	var hours = todayTime.getHours(); 
	var minutes = todayTime.getMinutes();
	var seconds = todayTime.getSeconds(); 

	var thisTime = (`${hours >= 10 ? hours : '0' + hours}${seperator}${minutes >= 10 ? minutes : '0' + minutes}${seperator}${seconds >= 10 ? seconds : '0' + seconds}`);
	return thisTime;
}

setTimeout(function () { 
	pushReserveTime();
	pushTicketTotal();
},0);




//upload module
var uploadService = (function(){
	
	function add(reply, callback, error) {
		console.log("add reply...............");

		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}//end error
		}) //end ajax
	}//end add
})



