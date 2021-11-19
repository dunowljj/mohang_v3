//organization event 
$(document).ready(function(){

		//수정버튼 클릭시 readonly제거하고, 그다음에 수정완료 버튼 클릭시 submit할 수 있도록
	$("button[input type='submit']").on("click", function(){
		e.preventDefault;
		$("input").removeAttr("readOnly");
		
	});
	
});
