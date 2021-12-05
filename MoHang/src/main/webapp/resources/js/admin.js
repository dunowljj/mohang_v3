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





