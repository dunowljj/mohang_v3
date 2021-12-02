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

//value 값 청소 
function pwUp_cleanModal(){
	$("#pw_update_form input").val("");
//	$("#pw_update_form input").attr('value', '');
}


function pwUp_unwrapWindowByMask (){
	$('#mask').fadeOut();
	$('.pwUp_ModalPopup').hide(); 
	pwUp_cleanModal();
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
function cancel_wrapWindowByMask (idVal){
	var cancel_maskHeight = $(document).height(); 
	var cancel_maskWidth = $(window).width(); 
	$('#mask').css({'width':cancel_maskWidth, 'height':cancel_maskHeight});
	$('#mask').fadeTo(10,0.8);
	
	
	$('.cancel_form_modal.'+idVal).show(); 
	$('.cancel_form_modal.'+idVal).center();
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
		idVal = $(this).attr('id');
		console.log(idVal);
		cancel_wrapWindowByMask(idVal); 
	});
});
$(function(){
	$('.cancel_close-area').click(function(e){
		e.preventDefault();
		cancel_unwrapWindowByMask();
	});
	
});
//ticket modal
function ticket_wrapWindowByMask(idVal){
	var ticket_maskHeight = $(document).height(); 
	var ticket_maskWidth = $(window).width(); 
	$('#mask').css({'width':ticket_maskWidth, 'height':ticket_maskHeight});
	$('#mask').fadeTo(10,0.8); 
	$(".ticket_ModalPopup."+idVal).show();
	$(".ticket_ModalPopup."+idVal).center();
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
		idVal = $(this).attr('id');
		console.log(idVal);
		ticket_wrapWindowByMask(idVal); 
	});
});

/*pay modal*/ 
$(function () { 
	$('#btn_payment_pop').click(function(e) {
		e.preventDefault();
		pay_wrapWindowByMask(); 
	});
});
function pay_wrapWindowByMask (){
	var  pay_maskHeight = $(document).height(); 
	var  pay_maskWidth = $(window).width(); 
	$('#mask').css({'width': pay_maskWidth, 'height': pay_maskHeight});
	$('#mask').fadeTo(10,0.8); 
	$('.pay_modal').show(); 
	$('.pay_modal').center();
	$('#wrap').attr('overflow', 'hidden');
}
function pay_unwrapWindowByMask (){
	$('#mask').fadeOut();
	$('.pay_modal').hide(); 
}
//pay modal end



//unwrap All modal
function unwrapAllMask(){
	pwUp_unwrapWindowByMask();
	cancel_unwrapWindowByMask();
	ticket_unwrapWindowByMask();
	pay_unwrapWindowByMask();
}
$(function(){
		$('#mask').click(function(e){
		e.preventDefault();
		unwrapAllMask()
	});
	
});
//unwrap All modal end








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



