
//댓글 crud함수를 담고있는 객체 생성
var commentFnc = (function(){
//1. 댓글 crud관련_insert 콜백함수 작성
	function insert(reviewComment, callback,error){
		console.log("댓글작성....");
		
		$.ajax({
			type: "POST",
			url:"/restReviewComment/insert",
			data: JSON.stringify(reviewComment), //json을 string화해서 받음
			contentType: "application/json; charset=utf-8",
			success: function(result, status, error){
				//성공했을때 콜백함수가 있으면, 콜백함수 실행
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, er){
				if(error){

				}
			}
		})
	}
	
	
//2. 리뷰번호관련댓글들 출력
	function getCommentList(review_num, callback, error){
		console.log(review_num+"번째 리뷰의 댓글 수신중");
		var url = "/restReviewComment/getReviewComment/"+review_num
			
		//json으로 넘어오는 값을 받아야하기 때문에 getJson이용
		$.getJSON("/restReviewComment/getReviewComment/"+review_num+".json",
				function(result){
			if(callback){
				callback(result);
			} 
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	//3.댓글 삭제(내 댓글만 삭제할 수 있어야함)
	function deleteReviewComment(data,callback, error){
		var review_comment_num = data.review_comment_num;
		console.log(" 삭제할 댓글 번호"+ review_comment_num);
		$.ajax({
			type: "delete", 
			url: "/restReviewComment/deleteReviewComment/"+review_comment_num,
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
			
		});
	}
	
	
	
	return {insert : insert,
		getCommentList : getCommentList,
		deleteReviewComment : deleteReviewComment
			};
	
})();



function showList(){
	var reviewNum = $("input[name='review_num']").val();
	var review_comment_box = $(".review_comment_box");
	
	commentFnc.getCommentList(reviewNum, function(reviewCommentList){
	var str = "";

	if(reviewCommentList ==null || reviewCommentList.length==0){
		review_comment_box.html("댓글이없습니다! 첫번째 댓글을 작성해주세요:)")
		return;
	}
	
	for(var i = 0; i< reviewCommentList.length; i++){
		str +="<div class = 'reply_box'>"
		str +="<hr>"
		str +="작성자 :"+reviewCommentList[i].account_num+"<br>"
		str +="날짜 :"+reviewCommentList[i].comment_date+"<br>"
		str +="댓글내용 :"+reviewCommentList[i].review_comment_content+"<br>"
		str += "<div class='rcNum'><input type='hidden' name='review_comment_num' value='"+reviewCommentList[i].review_comment_num+"'>"
		//str +="<c:if test={"+reviewCommentList[i].review_account_num+"}>"
		str +="<button id='modify'>수정</button>"
		str +="<button id='delete' onclick='deleteComment("+reviewCommentList[i].review_comment_num+")'>삭제</button></div><hr>"
		//str +="</c:if>"
			str +="</div>"
	}
	review_comment_box.html(str);
});
}
function deleteComment(review_comment_num){
	commentFnc.deleteReviewComment({"review_comment_num" : review_comment_num}, function(result){
		console.log("review_comment_num"+review_comment_num);
		console.log("삭제결과"+result);
		alert(result);
		showList();
	});
}


$(function(){
	var reviewNum = $("input[name='review_num']").val(); //글번호
	console.log("reviewNum :"+reviewNum);
	var review_comment_box = $(".review_comment_box");
	

	showList();

	//1. 댓글동록하는거
	var submitBtn = $("#dark");
	submitBtn.on("click",function(result){
		//객체에 저장할 값. 나머지는 자동으로 입력해줌. account_num은 controller에서 넣어줌. 
		
		var reviewCommentContent =$("textarea[name='review_comment_content']").val();
		console.log("reviewCommentContent :"+reviewCommentContent);
		
		
		commentFnc.insert({"review_num":reviewNum, "review_comment_content":reviewCommentContent}, function(result){
			console.log("result :"+result);
			
			//error 나오면 location으로 로그인보내기. 
			if(result =="error"){
				location.href ="/login/login";
			}else{
				
			alert(result);
			//등록한 댓글 보이게		
			showList();
			}
		})
		
		
	//3. 버튼누르면 삭제	
	var deleteBtn = $(".rcNum");
		deleteBtn.on("click",$("button[id='delete']"),function(result){
//			var reviewCommentNum  = $(this).find($("input[name='review_comment_num']")).val();
//			console.log("삭제할번호"+reviewCommentNum);
			console.log('test');
			
			commentFnc.deleteReviewComment(reviewCommentNum, function(result){
				alert("result");
				showList();
			});
		});
	});


	
});


