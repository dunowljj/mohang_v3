//수량 더하기 빼기
function count(type)  {
  const resultElement = document.getElementById('result');
  
  let number = resultElement.innerText;
  
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }
  else if(type === 'minus'&& number != 0)  {
    number = parseInt(number) - 1;
  }
  
  resultElement.innerText = number;
}

//pw modal
//window.onload = function(){
//document.addEventListener("DOMContentLoaded", ready);
//function ready(){
//const modal = document.getElementById("modal")
//const btn_modal = document.getElementById("pw_modal");
//const wrapper = document.querySelector(".bod_bod");
//btn_modal.addEventListener("click", e => {
//    modal.style.display = "flex"
//    wrapper.style.overflow ='hidden'
//})
//const closeBtn = modal.querySelector(".close-area")
//closeBtn.addEventListener("click", e => {
//    modal.style.display = "none"
//    wrapper.style.removeProperty("overflow");
//})
//modal.addEventListener("click", e => {
//    const evTarget = e.target;
//    if(evTarget.classList.contains("pw_update_modal_overlay")) {
//        modal.style.display = "none"
//    }
//});
//}
//}

//cancel modal
//window.onload = function(){
//document.addEventListener("DOMContentLoaded", ready1);
//function ready1(){
////	console.log("window ready : start");    		
//
//	const cancel_modal = document.querySelector(".openMask");
//	const cancel_btn_modal = document.querySelector(".cancle_modal_go");
//	cancel_btn_modal.addEventListener("click", e => {
////	    cancel_modal.style.display = "flex";
//	});
//	const cancel_closeBtn = cancel_modal.querySelector(".btn_cancel_back");
//	cancel_closeBtn.addEventListener("click", e => {
//		cancel_modal.style.display = "none";
//	});
//	cancel_modal.addEventListener("click", e => {
//	    const cancel_Target = e.target;
//	    if(cancel_evTarget.classList.contains("#wrap")) {
//	    	cancel_modal.style.display = "none";
//	    }
//	});
//}
//};

//function ready1(){
////	console.log("window ready : start");    		
//	
//	const cancel_modal = document.querySelector(".cancel_modal_overlay");
//	const cancel_btn_modal = document.querySelector(".cancle_modal_go");
//	cancel_btn_modal.addEventListener("click", e => {
//		cancel_modal.style.display = "flex";
//	});
//	const cancel_closeBtn = cancel_modal.querySelector(".btn_cancel_back");
//	cancel_closeBtn.addEventListener("click", e => {
//		cancel_modal.style.display = "none";
//	});
//	cancel_modal.addEventListener("click", e => {
//		const cancel_Target = e.target;
//		if(cancel_evTarget.classList.contains("cancel_modal_overlay")) {
//			cancel_modal.style.display = "none";
//		}
//	});
//}
//};

/*center 함수 재정의*/ 
$.fn.center = function () {
	this.css('top', Math.max(0,(($(window).height()-$(this).outerHeight())/2) + $(window).scrollTop())+'px');
	this.css('left', Math.max(0,(($(window).width()-$(this).outerWidth())/2) + $(window).scrollLeft())+'px'); 
	return this; 
} 
/*pwUp modal*/ 
function pwUp_wrapWindowByMask (){
	var  pwUp_maskHeight = $(document).height(); 
	var  pwUp_maskWidth = $(window).width(); 
	$('#mask').css({'width': pwUp_maskWidth, 'height': pwUp_maskHeight});
	$('#mask').fadeTo(10,0.8); 
	$('.pwUp_ModalPopup').show(); 
	$('.pwUp_ModalPopup').center();
	$('#wrap').attr('overflow', 'hidden');
}
function pwUp_unwrapWindowByMask (){
	$('#mask').fadeOut();
	$('.pwUp_ModalPopup').hide(); 
}

/*버튼 클릭시 위 함수 콜*/ 
$(function () { 
	$('.pwUp_openMask').click(function(e) {
		e.preventDefault();
		pwUp_wrapWindowByMask(); 
	});
});
$(function(){
	$('.pwUp_close-area').click(function(e){
		e.preventDefault();
		pwUp_unwrapWindowByMask();
	});
	
});
/*cancel modal*/ 
function cancel_wrapWindowByMask (){
	var cancel_maskHeight = $(document).height(); 
	var cancel_maskWidth = $(window).width(); 
	$('#mask').css({'width':cancel_maskWidth, 'height':cancel_maskHeight});
	$('#mask').fadeTo(10,0.8); 
	$('.cancel_form_modal').show(); 
	$('.cancel_form_modal').center();
//	$('#wrap').attr('overflow', 'hidden');
}
function cancel_unwrapWindowByMask (){
	$('#mask').fadeOut(); 
	$('.cancel_form_modal').hide(); 
}
/*버튼 클릭시 위 함수 콜*/ 
$(function () { 
	$('.cancel_openMask').click(function(e) {
		e.preventDefault();
		cancel_wrapWindowByMask(); 
	});
});
$(function(){
	$('.cancel_close-area').click(function(e){
		e.preventDefault();
		cancel_unwrapWindowByMask();
	});
	
});
//ticket modal
function ticket_wrapWindowByMask (){
	var ticket_maskHeight = $(document).height(); 
	var ticket_maskWidth = $(window).width(); 
	$('#mask').css({'width':ticket_maskWidth, 'height':ticket_maskHeight});
	$('#mask').fadeTo(10,0.8); 
	$('.ticket_ModalPopup').show(); 
	$('.ticket_ModalPopup').center();
//	$('#wrap').attr('overflow', 'hidden');
}
function ticket_unwrapWindowByMask (){
	$('#mask').fadeOut(); 
	$('.ticket_ModalPopup').hide(); 
}
/*btn click fn call*/ 
$(function () { 
	$('.ticket_openMask').click(function(e) {
		e.preventDefault();
		ticket_wrapWindowByMask(); 
	});
});
function unwrapAllMask(){
	pwUp_unwrapWindowByMask();
	cancel_unwrapWindowByMask();
	ticket_unwrapWindowByMask();
}
$(function(){
	$('#mask').click(function(e){
		e.preventDefault();
		unwrapAllMask()
	});
	
});
