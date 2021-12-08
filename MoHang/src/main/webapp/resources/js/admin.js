var actionForm= $("#actionForm");

$(".page-item a").on("click",function(e){
	e.preventDefault();
	console.log("@@@@@@@");
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
})


//공통적인 서취폼
var searchForm = $("#searchForm")
$("#searchForm button").on(
		"click",
		function(e) {


			if (!searchForm.find(
					"input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}

			searchForm.find("input[name='pageNum']")
					.val("1");
			e.preventDefault();

			searchForm.submit();

		});


$(function(){
	var inputs =$('input[name="checks"]')
	var value='';
	$("#checkAll").on('click',function(){
			if($("#checkAll").is(":checked")) $("input[name=checks]").prop("checked", true);
			else $("input[name=checks]").prop("checked", false);
			
			
		
			
			console.log('inputs'+inputs.length)
			for(var i=0; i<inputs.length;i++){
				value += $(inputs[i]).val()+","
			}
			console.log(value)
	})
	$('button[name="delete"]').on('click',function(e){
			e.preventDefault();
			location.href="/admin/noticeAllDelete?notice_num="+value;
	})
})



$(function(){
	var today = getToday();
	$("#admin_main1").find('li').eq(0).html(today)
});

function getToday(){
	var date = new Date();
	return date.getFullYear() + "-" + (date.getMonth()+1) +"-" + date.getDate();
}

//선택버튼 다중으로 선택할 수 있게
/*$("input[name=check]:checked").each(function(){
	var chk = $(this).val();
})

var chk_arr = [];
$("input[name=check]:cheked").each(function(){
	var chk = $(this).val();q
	chk_arr.push(chk);
})*/


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
		var account_id = reviewCommentList[i].account_id;
		
		str +="<div class = 'reply_box'>"
		str +="<hr>"
		str +="작성자 :"+account_id.substring(0, Math.ceil((account_id.length)/2))+"*****<br>"
		//moment(list[j].e_startDate).format("YYYY-MM-DD");

		str +="날짜 :"+moment(reviewCommentList[i].review_comment_date).format("YYYY-MM-DD")+"<br>"
		str +="댓글내용 :"+reviewCommentList[i].review_comment_content+"<br>"
		console.log("콘텐츠" + reviewCommentList[i].review_comment_content)
		console.log("번호"+reviewCommentList[i].account_num)
		//리뷰작성자만 수정 삭제 가능
		str += "<div class='rcNum'><input type='hidden' name='review_comment_num' value='"+reviewCommentList[i].review_comment_num+"'>"
		str +="<button id='delete' onclick='deleteComment("+reviewCommentList[i].review_comment_num+")'>삭제</button></div><hr>"
		str +="</div>"
	}
	review_comment_box.html(str);
});
}

//댓글삭제
function deleteComment(review_comment_num){
	commentFnc.deleteReviewComment({"review_comment_num" : review_comment_num}, function(result){
		console.log("review_comment_num"+review_comment_num);
		console.log("삭제결과"+result);
		alert(result);
		showList();
	});
}
