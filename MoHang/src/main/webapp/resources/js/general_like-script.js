	$(document).ready(function(){
		
		
		$(".like_empty_heart").click(function(e){
			var answer;
			answer = confirm("취소하시겠습니까? 확인을 누르시면 관심목록에서 제외됩니다.");
			if(answer == true){
//			e.preventDefault();
//			var e_num = $(this).parent().parent().find("input[id='hidden_e_num']").val();
//			var account_num = $(this).parent().parent().find("input[id='hidden_account_num']").val();
//			var inputs= $(this).parent().parent().find("input");
//			var e_num = inputs.val();
//			var account_num = inputs[1].val();
			var account_num= $(this).parent().prev().prev().val();
			var e_num = $(this).parent().prev().val();
			var wrap = $(this).closest(".like_one_wrap");
			
			console.log(e_num);
			console.log(account_num);
			
			$.ajax({
				url: '/general/cancelLike',
				data: {account_num:account_num,
					e_num:e_num},
				type: 'POST',
				success: function(result){
					console.log(result);
					wrap.remove();
				}
			});
		}
				
			})
	});//document.ready
	
	function delete_check(url){
		var answer;
		answer = confirm("취소하시겠습니까? 확인을 누르시면 관심목록에서 제외됩니다.");
		if(answer == true){
			location = url;
		}
	}
	
	
	