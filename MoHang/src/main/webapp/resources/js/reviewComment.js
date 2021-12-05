
//댓글 crud함수를 담고있는 객체 생성
var commentFnc = (function(){
//1. 댓글 crud관련_insert 콜백함수 작성
	function insert(reviewComment, callback,error){
		console.log("댓글작성....");
		
		$.ajax({
			type: "POST",
			url:"/restReviewComment/insert",
			dataType: JSON.stringify(reviewComment), //json을 string화해서 받음
			contentType: "application/json; charset=utf-8",
			success: function(result, status, error){
				//성공했을때 콜백함수가 있으면, 콜백함수 실행
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}
	
	return {insert : insert};
	
})();


$(document).ready(function(){

	var submitBtn = $("#dark");
	submitBtn.on("click",function(){
		
		//객체에 저장할 값. 나머지는 자동으로 입력해줌. account_num은 controller에서 넣어줌. 
		var reviewNum = "<c:out value='${reviewComment.review_num}'/>";
		var reviewCommentContent =$("input[name='review_comment_content']").val();
		
		commentFnc.insert({"review_num":reviewNum, "review_comment_content":reviewCommentContent}, function(result){
			alert(result);
			console.log(ReviewCommentVO);
		})
	});



})