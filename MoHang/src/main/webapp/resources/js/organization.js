//organization event 
$(document).ready(function(){
	var btn = $("button[type='submit']");

	//수정버튼 클릭시 readonly제거하고, 그다음에 수정완료 버튼 클릭시 submit할 수 있도록
	btn.on("click", function(e){
		btn.remove();
		$('.btnPage').append('<button type="submit" class="btn btn-primary btn-sm">단체 정보 수정</button>');
		$("input").removeAttr("readOnly");
	});
	
	$('.btnPage').on("click", "button", function(e){
		$('form').submit();
		alert("단체정보가 성공적으로 수정되었습니다.");
	});

});
