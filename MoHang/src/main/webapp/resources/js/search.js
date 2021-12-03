$(function() {
    // 검색다운이벤트
	var buttons = $('.search_dropbutton');
	var searchs = $('.search_dropcontent');
	var buttoncancel = $('.button_cancel');
	var buttonconfirm = $('.button_confirm');
	
	$.each(buttons, function(i, item) {
		$(item).click(function(e) {
			pwUp_wrapWindowByMask ();
			$(searchs.get(i)).show();
			$(searchs.get(i)).click(function(e) {
				e.stopPropagation();
			})
		})
	})
	// 검색 필터 창 끄기
	$.each(buttoncancel, function(i , item) {
		$(item).click(function() {
			$(searchs.get(i)).hide();
			unwrapAllMask();
		})
	})
	$.each(buttonconfirm, function(i , item) {
		$(item).click(function() {
			$(searchs.get(i)).hide();
			unwrapAllMask();
		})
	})
	 
	/*modal*/ 
	function pwUp_wrapWindowByMask (){
		var  pwUp_maskHeight = $(document).height(); 
		var  pwUp_maskWidth = $(window).width(); 
		$('#mask').css({'width': pwUp_maskWidth, 'height': pwUp_maskHeight});
		$('#mask').fadeTo(10,0.8); 
		$('#wrap').attr('overflow', 'hidden');
	}
	function pwUp_unwrapWindowByMask (){
		$('#mask').fadeOut();
		$('.search_dropcontent').hide(); 
	}
	function unwrapAllMask(){
		pwUp_unwrapWindowByMask();
	}
	$(function(){
		$('#mask').click(function(e){
			e.preventDefault();
			unwrapAllMask()
		});
		
	});
	// 검색 추가 필터 이벤트 and form
	var filterbtn = $('.filter-btn');
	var value = '';
	var inputs = $('input[type="hidden"]');
	
	$('input[type=radio]').on('change',function() {
		value = this.value;
		if($(this).attr('name')=='price'){
			$(filterbtn.get(3)).html(value+'<i class="far fa-times-circle cursor-pointer"></i>');
			$(filterbtn.get(3)).css('display','');
			$($(inputs[2]).val(""));
			$($(inputs[6]).val(""));
			$($(inputs[9]).val(""));
			$($(inputs[10]).val(""));
			$($(inputs[11]).val(""));
			$($(inputs[12]).val(""));
			$($(inputs[13]).val(""));
			$($(inputs[14]).val(""));
			$($(inputs[15]).val(""));
			$($(inputs[16]).val(""));
			$($(inputs[17]).val(""));
			$($(inputs[18]).val(""));
			$($(inputs[19]).val(""));
			$($(inputs[20]).val(""));
			$($(inputs[21]).val(""));
			$($(inputs[22]).val(""));
			$($(inputs[24]).val(""));
			$($(inputs[25]).val(""));
			$($(inputs[26]).val(""));
			$($(inputs[27]).val(""));
		}else if($(this).attr('name')=='type'){
			$(filterbtn.get(1)).html(value+'<i class="far fa-times-circle cursor-pointer"></i>');
			$(filterbtn.get(1)).css('display','');
			$($(inputs[1]).val(""));
			$($(inputs[5]).val(""));
			$($(inputs[9]).val(""));
			$($(inputs[10]).val(""));
			$($(inputs[11]).val(""));
			$($(inputs[12]).val(""));
			$($(inputs[13]).val(""));
			$($(inputs[14]).val(""));
			$($(inputs[15]).val(""));
			$($(inputs[16]).val(""));
			$($(inputs[17]).val(""));
			$($(inputs[18]).val(""));
			$($(inputs[19]).val(""));
			$($(inputs[20]).val(""));
			$($(inputs[21]).val(""));
			$($(inputs[22]).val(""));
			$($(inputs[24]).val(""));
			$($(inputs[25]).val(""));
			$($(inputs[26]).val(""));
			$($(inputs[27]).val(""));
		}else if ($(this).attr('name')=='field'){
			$(filterbtn.get(2)).html(value+'<i class="far fa-times-circle cursor-pointer"></i>');
			$(filterbtn.get(2)).css('display','');
			$($(inputs[0]).val(""));
			$($(inputs[4]).val(""));
			$($(inputs[9]).val(""));
			$($(inputs[10]).val(""));
			$($(inputs[11]).val(""));
			$($(inputs[12]).val(""));
			$($(inputs[13]).val(""));
			$($(inputs[14]).val(""));
			$($(inputs[15]).val(""));
			$($(inputs[16]).val(""));
			$($(inputs[17]).val(""));
			$($(inputs[18]).val(""));
			$($(inputs[19]).val(""));
			$($(inputs[20]).val(""));
			$($(inputs[21]).val(""));
			$($(inputs[22]).val(""));
			$($(inputs[24]).val(""));
			$($(inputs[25]).val(""));
			$($(inputs[26]).val(""));
			$($(inputs[27]).val(""));
			$('.eventfieldtitle').html("");
			value = value.replace(',','');
			$('.eventfieldtitle').html(value);
			$('.eventfieldtitle').css('display','');
		}else if ($(this).attr('name')=='keyword'){
			$($(inputs[3]).val(""));
			$($(inputs[7]).val(""));
			$($(inputs[9]).val(""));
			$($(inputs[10]).val(""));
			$($(inputs[11]).val(""));
			$($(inputs[12]).val(""));
			$($(inputs[13]).val(""));
			$($(inputs[14]).val(""));
			$($(inputs[15]).val(""));
			$($(inputs[16]).val(""));
			$($(inputs[17]).val(""));
			$($(inputs[18]).val(""));
			$($(inputs[19]).val(""));
			$($(inputs[20]).val(""));
			$($(inputs[21]).val(""));
			$($(inputs[22]).val(""));
			$($(inputs[24]).val(""));
			$($(inputs[25]).val(""));
			$($(inputs[26]).val(""));
			$($(inputs[27]).val(""));
		}
			$("#searchform_form").submit();
			
		
	})
	// 기간 form 
	var e_startdate= '';
	var e_enddate ='';
	$('#e_startdate').on('change',function(){
		e_startdate =$("#e_startdate").val();
		console.log(e_startdate)
	})
	$('#e_enddate').on('change',function(){
		e_enddate =$("#e_enddate").val();
		console.log(e_enddate)
		if(e_startdate>=e_enddate){

			$("#e_enddate").val("연도-월-일");
			$("#e_startdate").val("연도-월-일");
			alert('다시 입력 해주세요')
		}else{
			$("#searchform_form").submit();
		}
	})

	// 검색어 삭제 필터벤트
	var filterbtns = $('.filter-btn');
	var text = '';
	
	$.each(filterbtns, function(i, item) {
		$(item).on('click',function(e) {
			$(item).hide();
			
			text = $(item).text();
			var id=$(this).attr('id');
			if(id=='field1'){
				$('.eventfieldtitle').html('<div class="eventfieldtitle"></div>');
				$("#check").val('field');
				$($(inputs[0]).val(""));
				$($(inputs[4]).val(""));
			}else if(id=='type1'){
				$("#check").val('type');
				$($(inputs[1]).val(""));
				$($(inputs[5]).val(""));
			}else if(id== 'price1'){
				$("#check").val('price');
				$($(inputs[2]).val(""));
				$($(inputs[6]).val(""));
			}else if(id== 'keyword1'){
				$($(inputs[3]).val(""));
				$($(inputs[7]).val(""));
			}
			$("#searchform_form").submit();	
			$('input[type=radio]').each(function(i) {
				var value = $(this).val();
				if(value==text){
					$(this).attr('checked',false);
				}
			})
		})
	});
	// 인기 검색어 스크롤
	var myVar=setInterval(function(){
		myTimer()
		},3000);
	var rank='';
	var px=$('.rank01').css('top');
	function myTimer(){
		for(var i=1;i<=10;i++){
			rank = '.rank0'+i;
			px = $(rank).css('top');
			if(parseInt(px)==0){
				px=-220;
			}
			$(rank).slideToggle(900, "linear", function(){ 
				$(rank).css('top',parseInt(px)+22+'px');
			});
			$(rank).css('top',parseInt(px)+22+'px');
		}
	}
	// 체크박스 하나만
    $('input[type="checkbox"]').bind('click',function() {
    	    $('input[type="checkbox"]').not(this).prop("checked", false);
    	    $("#second_search").submit();
    	   
    });
 
	// 페이지 이동
    $('.eventimg').on('click',function(e){
    	var e_num =$(this).find('input').val();
    	location.href='/event/eventDetail?e_num='+e_num;
    })
    
    $('.heart1').on('click',function(){
    	var account_num =1;
    	var e_num =$(this).find("input").val();
		$.ajax({
			type : 'post',
			url : '/event/like',
			data : {'account_num':account_num,'e_num':e_num },
			success : function(result, status, xhr) {
					location.reload();
			},
			error : function(xhr, status, er) {
				
			}
		})
    })
    
    
})
