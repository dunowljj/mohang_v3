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
