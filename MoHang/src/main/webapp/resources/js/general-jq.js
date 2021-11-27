$(function(){
	$("#payPrac img").click(function(){
		$.ajax({
			url:'/jq/kakaopay',
			dataType: 'json',
//			type : 'POST',
			success: function(data){
				alert(JSON.stringify(data));
//				var box = data.next_redirect_pc_url;
//				console.log(JSON.stringify(box));
//				window.open(box);
			},
			error:function(error){
				alert(error);
			}
		});
		
	});
});













