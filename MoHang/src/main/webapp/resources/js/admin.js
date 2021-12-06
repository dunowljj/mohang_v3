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
	$("#checkAll").on('click',function(){
			console.log('test');
			if($("#checkAll").is(":checked")) $("input[name=check]").prop("checked", true);
			else $("input[name=check]").prop("checked", false);

	})
})


//선택버튼 다중으로 선택할 수 있게
/*$("input[name=check]:checked").each(function(){
	var chk = $(this).val();
})

var chk_arr = [];
$("input[name=check]:cheked").each(function(){
	var chk = $(this).val();
	chk_arr.push(chk);
})*/
