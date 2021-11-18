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
	$('input[type=radio]').on('change',function() {
		value = this.value;
		if($(this).attr('name')=='price'){
			$(filterbtn.get(3)).html(value+'<i class="far fa-times-circle cursor-pointer"></i>');
			$(filterbtn.get(3)).css('display','');
		}else if($(this).attr('name')=='event-type'){
			$(filterbtn.get(1)).html(value+'<i class="far fa-times-circle cursor-pointer"></i>');
			$(filterbtn.get(1)).css('display','');
		}else if ($(this).attr('name')=='event-field'){
			$(filterbtn.get(2)).html(value+'<i class="far fa-times-circle cursor-pointer"></i>');
			$(filterbtn.get(2)).css('display','');
			$('.eventfieldtitle').html(value);
			$('.eventfieldtitle').css('display','');
		}
		$("#searchform_form").submit();
	})
	// 기간 form 
	$('#toDate').on('change',function(){
		var fromDate =$("#fromDate").val();
		if(fromDate !=null || fromDate ==''){
			$("#searchform_form").submit();			
		}
		
	})
	// 검색 삭제 필터 이벤트
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
			}else if(id=='type1'){
				$("#check").val('type');
			}else if(id== 'price1'){
				$("#check").val('price');
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
    });
	// 페이지 이동
    $('.eventbox_in').on('click',function(){
    	location.href="#";

    })

})
