//------------------------reserve start-------------------------------
//수량 더하기 빼기
function count(type)  {
   //티켓 표현요소들 선택
   const ticketNumberElement = document.getElementById('ticketCount');
   const ticketTotalElement = document.getElementById('ticketTotal');
   
   const m_ticketNumberElement = document.getElementById('m_ticketCount');
   const m_ticketTotalElement = document.getElementById('m_ticketTotal');
   
   //무료체크
   const feeFreeCheck = document.getElementsByName('e_price')[0].value;
   
   console.log("feeFreeCheck"+feeFreeCheck);
   var ticketPrice =0;
   var ticketTotal =0;
   
   if(feeFreeCheck !=0){
      const ticketPriceElement = document.getElementById('ticketPrice');
       ticketPrice = ticketPriceElement.innerText;
       ticketTotal = ticketPriceElement.innerText;
      console.log("이거 if"+ticketPrice);
   } else{
       ticketTotal =0;
       ticketPrice =0;
   }
   
   console.log("이거if이후"+ticketPrice);
   
   
   
  let ticketNumber = ticketNumberElement.innerText;
  
  console.log("remainTicket:"+remainTicket);
  console.log("ticketNumber:"+ticketNumber);
  console.log("e_num:"+e_num);
  
  remainTicketI = parseInt(remainTicket);
  console.log(remainTicketI);
  
 //+ , -
   if(type === 'plus' && ticketNumber < remainTicketI) {
     ticketNumber = parseInt(ticketNumber) + 1;
  }
  else if(type === 'minus'&& ticketNumber != 1)  {
     ticketNumber = parseInt(ticketNumber) - 1;
  }
  else if(ticketNumber >= remainTicketI){
      alert("남은 티켓이 없습니다!");
   }

   if(feeFreeCheck!=0){
      var totalPrice = parseInt(ticketPrice)*parseInt(ticketNumber);
   } else{
      var totalPrice =0;
   }
  ticketNumberElement.innerText = ticketNumber;
  ticketTotalElement.innerText = totalPrice;
  
  
  m_ticketNumberElement.innerText = ticketNumber;
  m_ticketTotalElement.innerText = totalPrice;
  
  document.getElementById("ticket_reservation_amount").value = parseInt(ticketNumber);
  document.getElementById("ticket_payment_price").value = parseInt(totalPrice);
  
}

//var recruiteConstraint = "<c:out alue='${event.e_recruitepeople}'/>"

//필요없어짐
function checkDateInput(){
   var x=document.forms["reserveForm"]["ticket_reservation_date"].value;
//   var x =document.getElementsByName('ticket_reservation_date')[0].value;
   if (x==null || x=="" || x==undefined){
      alert("날짜를 입력해 주세요");
      return false;
   }
   return true;
}


//제출 전 이벤트
function beforeSubmit(){
        pushPayTime();
}



//티켓 총 가격 전달
function pushTicketTotal(){
   document.getElementById("ticket_payment_price").value = document.getElementsByName('e_price')[0].value;
}

//submit 시간 전달
function pushPayTime(){
   document.getElementById("S_ticket_payment_time").value=getDateTrim('-', ':', true)
   console.log(document.getElementById("S_ticket_payment_time").value)
}

//reserve페이지 진입 시점 날짜와 시간 전달 
function pushReserveTime(){
   document.getElementById("S_ticket_reservation_time").value=getDateTrim('-', ':', true)
   console.log(document.getElementById("S_ticket_reservation_time").value)
}

//function pushFmt(){
//   var fmtPas = document.getElementsByTagName("fmt")[0].getAttribute('value');
//   console.log(fmtPas);
//   fmtDat = getTodayAndTimeTrim();
//   console.log(fmtPas);
//}
//날짜에다가  시간 선택해서 받기
function getDateTrim(seperator1, seperator2, isContainTime){
   let today = new Date()
   var year = today.getFullYear();
   var month = today.getMonth()+1; 
   var date = today.getDate();
   var hours = today.getHours(); 
   var minutes = today.getMinutes();
   var seconds = today.getSeconds(); 
   
   if(isContainTime){
      var thisDateAndTime = (`${year}${seperator1}${month >= 10 ? month : '0' + month}${seperator1}${date >= 10 ? date : '0' + date} ${hours >= 10 ? hours : '0' + hours}${seperator2}${minutes >= 10 ? minutes : '0' + minutes}${seperator2}${seconds >= 10 ? seconds : '0' + seconds}`)


      return thisDateAndTime;
   } else{
      return getToday(seperator1);
   }
}



setTimeout(function () { 
   pushTicketTotal();
   pushPayTime();
},0);







